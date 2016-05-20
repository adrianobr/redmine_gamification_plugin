class GamificationPremiumController < ApplicationController
  #unloadable

  def index
    if params[:id]
      user_id = params[:id]
    else
      user_id = User.current.id
    end
    @user = Gamification.find_by_user_id(user_id)
    if !@user
      @user = Gamification.find_by_user_id(User.current.id)
    end

    @medal_types = GamificationMedalType.all
    @medals = @user.gamification_medal_assignment

    @medal_count = {}
    GamificationMedalType.all.each do |medal|
      @medal_count[medal.name] = 0
    end
    @medals.each do |medal|
      @medal_count[medal.gamification_medal_type.name] += 1
    end
  end

  def premium
  end

end
