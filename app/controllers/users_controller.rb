class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'ユーザーが登録されました'
    else
      flash.now[:notice] = 'ユーザー登録に失敗しました'
      render :new,status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to root_path, notice: 'アカウントが削除されました。またのご利用お待ちしています'
  end

  def show
    @user = User.find(params[:id])
    @count = @user.stories.count
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
