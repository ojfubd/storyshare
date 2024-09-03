class Admin::BaseController < ApplicationController
    before_action :check_admin
    layout 'admin/layouts/application'
    
  
    private
  
    def not_authenticated
      flash[:warning] = "管理者ではありません"
      redirect_to admin_login_path
    end
  
    def check_admin
      if current_user.nil?
        redirect_to root_path, danger: "管理者ではありません"
      elsif !current_user.admin?
      redirect_to root_path, danger: "管理者ではありません"
      end
    end
end