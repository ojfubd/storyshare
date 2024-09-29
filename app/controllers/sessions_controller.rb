class SessionsController < ApplicationController
  skip_before_action :log_in_low
  def new
    @user=User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, notice: 'ログインに成功しました'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました'
  end
end
