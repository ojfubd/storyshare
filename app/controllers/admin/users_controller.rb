class Admin::UsersController < ApplicationController
    def index
        @users = User.all
    end

    def edit
      @user = User.find(params[:id])
    end
    
    def update
       @user = User.find(params[:id])
        if @user.update(story_params)
            redirect_to admin_users_path, notice: 'User was successfully updated.'
        else
            flash[:error] = @user.errors.full_messages.join(", ")
        end
    end
    
      def destroy
        @user = User.find(params[:id])
        @user.destroy!
        redirect_to admin_users_path, notice: 'User was successfully deleted.'
      end
    
      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
end
