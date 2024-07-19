class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update]

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to profile_path, notice: 'プロフィールを更新しました。'
    else
      flash.now[:alert] = 'プロフィールを更新できませんでした。'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end