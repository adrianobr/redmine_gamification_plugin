# coding: utf-8

#Rails.configuration.to_prepare do
#  unless Issue.included_modules.include? IssuePatch
#    Issue.send(:include, IssuePatch)
#  end
#
#  unless WikiContent.included_modules.include? WikiPatch
#    WikiContent.send(:include, WikiPatch)
#  end
#end

Redmine::Plugin.register :redmine_gamification_plugin do
  name 'Gamificação'
  author 'Marco Castro'
  description '...'
  version '0.1.0'
  url 'https://github.com/marcodotcastro/redmine_gamification_plugin'
  author_url 'https://github.com/marcodotcastro'

  permission :redmine_gamification_plugin, {:redmine_gamification_plugin => [:project]}, :public => true

  menu :top_menu, :redmine_gamification_plugin, {controller: 'gamification', action: 'index'}, :caption => :plugin_name
  menu :project_menu, :project_gamification, {controller: 'gamification', action: 'project'}, caption: 'Status', param: :project_id 
  menu :admin_menu, :premium_gamification, {controller: 'gamification_premium', action: 'index'}, caption: 'Prêmio', param: :project_id

  settings :default => {'empty' => true}, :partial => 'settings/gamification_settings'
end

require_dependency 'hooks/controller_issues_edit_after_save_hook.rb'
require_dependency 'hooks/controller_issues_edit_before_save_hook.rb'
require_dependency 'hooks/controller_issues_bulk_edit_before_save_hook.rb'
require_dependency 'hooks/controller_issues_new_after_save_hook.rb'
require_dependency 'hooks/controller_wiki_edit_after_save_hook.rb'
