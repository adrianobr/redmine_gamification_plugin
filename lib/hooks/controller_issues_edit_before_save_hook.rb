require 'gamification_util.rb'

module Hooks
  class ControllerIssuesEditBeforeSaveHook < Redmine::Hook::ViewListener

    include GamificationUtil

    def controller_issues_edit_before_save(context={})
      # will use gamification for edit issues?
      if Setting.plugin_redmine_gamification_plugin.has_key?("use_edit_issue")
        if context[:params] && context[:params][:issue]
          if User.current.allowed_to?(:assign_deliverable_to_issue, context[:issue].project)
            if context[:params][:issue][:deliverable_id].present?
              deliverable = Deliverable.find_by_id(context[:params][:issue][:deliverable_id])
              if deliverable.contract.project == context[:issue].project
                context[:issue].deliverable = deliverable
              end

            else
              context[:issue].deliverable = nil
            end
          end
          
          original_issue = Issue.find(context[:params][:id])
          project_id = original_issue.project_id
          status_orig = IssueStatus.find_by_id(context[:params][:issue][:status_id])
          status_mod = IssueStatus.find_by_id(original_issue.status_id)
          
          points = 0
          
          if (status_orig.position < status_mod.position)
            if (Setting.plugin_redmine_gamification_plugin.has_key?('rem_score_status_'+status_mod.name))
              points += Setting.plugin_redmine_gamification_plugin['rem_score_status_'+status_mod.name].to_i
            end
          else if (status_orig.position > status_mod.position)
              if (Setting.plugin_redmine_gamification_plugin.has_key?('add_score_status_'+status_orig.name))
                points += Setting.plugin_redmine_gamification_plugin['add_score_status_'+status_orig.name].to_i
              end
            end
          end

          user_id = assignee_to_current(context, original_issue)

          points = sum_tracker(context, original_issue, points)

          points = sum_priority(context, points)

          points = sum_badges(context, points, user_id)

          assigning_points(points, user_id)
          
          gamification_project_update(points, project_id, user_id)
        end
      end
      return ''
    end

    def assigning_points(points, user_id)
      if Gamification.exists?({user_id: user_id})
        user = Gamification.find_by_user_id(user_id)
        #user_badge = GamificationBadge.find_by_user_id(user_id)
        user.up_point(points)

        old_lvl = user.level
        new_lvl = decide_level(user.point)
        user.level = check_level(old_lvl, new_lvl)
        user.up_ticket_count
        user.save

        # update user badge
        #new_badge = check_badge(user_badge, user.level)
        #new_badge.save
      end
    end

    def gamification_project_update(points, project_id, user_id)
      if GamificationProject.exists?({user_id: user_id, project_id: project_id})
        user_project = GamificationProject.find_by_user_id_and_project_id(user_id, project_id)
        user_project.up_point(points)
        user_project.save
      end
    end

    def sum_tracker(context, original_issue, points)
      if (original_issue.tracker_id != context[:params][:issue][:tracker_id].to_i)
        tracker = Tracker.find_by_id(context[:params][:issue][:tracker_id])
        if (Setting.plugin_redmine_gamification_plugin.has_key?('add_score_tracker_'+ tracker.name))
          points += Setting.plugin_redmine_gamification_plugin['add_score_tracker_'+ tracker.name].to_i
        end
      end
      points
    end

    def assignee_to_current(context, original_issue)
      if (Setting.plugin_redmine_gamification_plugin.has_key?('assignee_to_current'))
        user_id = original_issue.assigned_to_id
      else
        user_id = context[:params][:issue][:assigned_to_id]
      end
      user_id
    end

    def sum_priority(context, points)
      status = IssueStatus.find_by_id(context[:issue][:status_id])
      if (status[:is_closed])
        priority = Enumeration.find_by_id(context[:params][:issue][:priority_id])
        if (Setting.plugin_redmine_gamification_plugin.has_key?('add_score_priority_'+ priority.name))
          points += Setting.plugin_redmine_gamification_plugin['add_score_priority_'+ priority.name].to_i
        end
      end
      points
    end

    def sum_badges(context, points, user_id)
      status = IssueStatus.find_by_id(context[:issue][:status_id])
      if (status[:is_closed])
        types = GamificationMedalType.all

        types.each do |type|
          badge_count = GamificationMedalAssignment.where(user_assign_id: user_id, medal_id: type.id).count

          if (Setting.plugin_redmine_gamification_plugin.has_key?('add_score_badges_'+ type.name))
            points += Setting.plugin_redmine_gamification_plugin['add_score_badges_'+ type.name].to_i * badge_count
          end

          binding.pry
        end


      end
      points
    end

  end
end
