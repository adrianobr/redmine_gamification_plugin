class GamificationPremiaController < ApplicationController
  #unloadable

  before_action :set_user, only: [:index, :new,  :show, :edit, :update, :destroy]
  before_action :set_premium, only: [:show, :edit, :update, :destroy]

  def index
    @premia = GamificationPremium.all
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
        format.html { redirect_to @premium, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @premium }
      else
        format.html { render :new }
        format.json { render json: @premium.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def premium
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
