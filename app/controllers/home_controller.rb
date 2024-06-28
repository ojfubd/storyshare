class HomeController < ApplicationController
  before_action :set_user, only: %i[my myedit myupdate]
  def top; end
  def my; end
  def myedit; end

  def new_guest
    user = User.guest
   @user = login(user.email, '0000')
   Rails.logger.debug "Login result: #{@user.inspect}"
   if @user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
   else
    redirect_to root_path, notice: 'ゲストユーザーのログイン失敗しました。'
   end
  end

  def myupdate
    if @user.update(user_params)
      redirect_to my_path, success: "ユーザ変更完了しました" 
    else
      flash.now['danger'] = "ユーザ変更に失敗しました"
      render :my, status: :unprocessable_entity
    end
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
