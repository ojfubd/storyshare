class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_q
    before_action :log_in_low 
    add_flash_types :success, :danger

    private
  
    def set_q
      @q = Story.ransack(params[:q]) # Ransack::Searchオブジェクトを設定Ransack::
    end

    def not_authenticated
      redirect_to login_path, danger: 'ログインしてください'
    end

    def log_in_low
      if current_user.present?
        if current_user.read
          p "利用規約を同意しています"
        else
          redirect_to pages_low_path unless request.path == pages_low_path # リダイレクト先で再実行しない
        end
      else
        p "ログインなし"
      end
    end

end
