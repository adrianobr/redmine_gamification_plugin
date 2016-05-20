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

    @premiums = GamificationPremium.all
  end

  def create
    GamificationPremium.create(description: params[:description], tickets: params[:tickets])
    binding.pry

    respond_to do |format|
        format.html { redirect_to action: "index"}
    end

  end

  def premium
  end

end
