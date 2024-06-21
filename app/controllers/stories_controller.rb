class StoriesController < ApplicationController
      def index
        @stories = Story.all
      end
    
      def new
        @story = Story.new
      end
    
      def create
            # データベースに一時保存する処理
            @story = Story.new(story_params)
            @story.user = current_user 
            if @story.save
              redirect_to stories_path, notice: '物語が作成されました'
            else
              flash[:error] = @story.errors.full_messages.join(", ")
              render :new
            end
      end
     
      
  

      def edit
        @story = Story.find(params[:id])
        render :new

      end
    
      def update
        @story = Story.find(params[:id])
        @story.user = current_user  # ここでUserを設定する
        if @story.update(story_params)
            redirect_to stories_path, notice: 'Story was successfully updated.'
        else
            flash[:error] = @story.errors.full_messages.join(", ")
        end
      end


      def destroy
        @story = Story.find(params[:id])
        @story.destroy!
        redirect_to stories_path, notice: 'Story was successfully deleted.'
      end

      def show
        @story = Story.find(params[:id])
      end
    
      def sho_story
        @story = Story.find(params[:id])
      end
    
      def sho_theme
        @story = Story.find(params[:id])
      end
    
      def sho_world_view
        @story = Story.find(params[:id])
      end
    
      def sho_text
        @story = Story.find(params[:id])
      end

      private

      def story_params
        params.require(:story).permit(:name, :category,:commit, :body, :place, :era, :character,:theme, :motif, :memo)
      end

      def in_transaction?
        ActiveRecord::Base.connection.open_transactions > 0
      end

end