class HomeController < ApplicationController
  before_action :set_user, only: %i[my myedit myupdate]
  def top; end
  def my; end
  def myedit; end

  def myupdate
    if @user.update(user_params)
      redirect_to my_path, success: "ユーザ変更完了しました" 
    else
      flash.now['danger'] = "ユーザ変更に失敗しました"
      render :my, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.require(:user).permit(:avatar, :avatar_cache)
  end
end
