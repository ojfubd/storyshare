class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :set_q

    private
  
    def set_q
      @q = Story.ransack(params[:q]) # Ransack::Searchオブジェクトを設定
    end
end
