class Admin::UsersSessionsController < Admin::BaseController
  
    def new; end
  
    def create
      @user = login(params[:email], params[:password])
      if @user
        redirect_to admin_root_path, success: 'ログイン成功しました'
      else
        flash.now[:danger] = 'ログインできませんでした'
        render :new
      end
    end
  
    def destroy
      logout
      redirect_to admin_login_path, status: :see_other, danger: 'ログアウトしますか？'
    end
  end
  