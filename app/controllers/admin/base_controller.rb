class Admin::BaseController < ApplicationController
    before_action :check_admin
    layout 'admin/layouts/application'
    
  
    private
  
    def not_authenticated
      flash[:warning] = "管理者ではありません"
      redirect_to admin_login_path
    end
  
    def check_admin
      redirect_to root_path, danger: "管理者ではありません" unless current_user.admin?
    end
end