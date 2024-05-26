class StoriesController < ApplicationController
      def index
        @stories = Story.all
      end
    
      def new
        session[:story_params] ||= {}
        @story = Story.new(session[:story_params])
        @page = params[:page].to_i
        Rails.logger.debug session[:story_params].inspect
      end
    
      def create
        session[:story_params].deep_merge!(story_params)
        Rails.logger.debug session[:story_params].inspect
        @story = Story.new(session[:story_params])
        @story.user = current_user  # ここでUserを設定する
        @page = params[:page].to_i
        if @page < 3
            @page += 1
            render :new 
          else
            if @story.save
              session[:story_params] = nil
              redirect_to stories_path, notice: 'Story was successfully created.'
            else
                Rails.logger.debug @story.errors.full_messages.join(", ")
                flash[:now] = '登録失敗しました' 
                puts @story.errors.full_messages.join(", ")
              render :new
            end
          end
      end

      def edit
        @story = Story.find(params[:id])
        @page = 0
        render :new

      end
    
      def update
        session[:story_params] ||= {}
        session[:story_params].deep_merge!(story_params.to_h) if params[:story]
        @story = Story.find(params[:id])
        @story.user = current_user  # ここでUserを設定する
        @page = params[:page].to_i
    
        if @page < 3
          @page += 1
          render :new
        else
          if @story.update(session[:story_params])
            session[:story_params] = nil
            redirect_to stories_path, notice: 'Story was successfully updated.'
          else
            flash[:now] = '更新失敗しました'
            render :new
          end
        end
      end

      def destroy
        @story = Story.find(params[:id])
        @story.destroy
        redirect_to stories_path, notice: 'Story was successfully deleted.'
      end


      private

      def story_params
        params.require(:story).permit(:name, :category,:commit, :body, :place, :era, :character,:theme, :motif, :memo)
      end
end