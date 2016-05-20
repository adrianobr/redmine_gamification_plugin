class GamificationPremiumController < ApplicationController
  #unloadable

  before_action :set_user, only: [:index, :show, :edit, :update, :destroy]

  def index
    @premiums = GamificationPremium.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
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
      if params[:id]
        user_id = params[:id]
      else
        user_id = User.current.id
      end
      @user = Gamification.find_by_user_id(user_id)
      if !@user
        @user = Gamification.find_by_user_id(User.current.id)
      end
    end

    def user_params
      params.require(:user).permit(:name)
    end

end
