class Admin::UsersController < Admin::BaseController
    def index
        @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end
    
    def update
       @user = User.find(params[:id])
        if @user.update(user_params)
          puts params.inspect
            redirect_to admin_login_path, notice: 'User was successfully updated.'
        else
          puts params.inspect
          puts @user.errors.inspect  # ここを修正
            flash[:error] = @user.errors.full_messages.join(", ")
            render :edit # ここで元の編集ページに戻る
        end
    end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy!
        redirect_to admin_users_path, notice: 'User was successfully deleted.'
      end
    
      private

      def user_params
        params.require(:user).permit(:name, :email)
      end
end
