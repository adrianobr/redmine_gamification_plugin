class GamificationPremiaController < ApplicationController
  #unloadable

  before_action :set_user, only: [:index, :new,  :show, :edit, :update, :destroy]
  before_action :set_premium, only: [:show, :edit, :update, :destroy]

  def index
    @premia = GamificationPremium.all.order(tickets: :asc)
  end

  def show
  end

  def new
    @premium = GamificationPremium.new
  end

  def edit
  end

  def create
    @premium = GamificationPremium.new(premium_params)

    respond_to do |format|
      if @premium.save
        format.html { redirect_to @premium, notice: 'Premium was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @premium.update(premium_params)
        format.html { redirect_to @premium, notice: 'Premium was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @premium.destroy
    respond_to do |format|
      format.html { redirect_to gamification_premia_url, notice: 'Premium was successfully destroyed.' }
    end
  end

  private
    def set_user
      user_id = User.current.id
      @user = Gamification.find_by_user_id(user_id)
    end

    def set_premium
      @premium = GamificationPremium.find(params[:id])
    end

    def premium_params
      params.require(:gamification_premium).permit(:description, :tickets)
    end

end
