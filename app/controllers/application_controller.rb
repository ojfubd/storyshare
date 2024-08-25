class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_q
    add_flash_types :success, :danger

    private
  
    def set_q
      @q = Story.ransack(params[:q]) # Ransack::Searchオブジェクトを設定Ransack::
    end

    def not_authenticated
      redirect_to login_path, danger: 'ログインしてください'
    end

end
