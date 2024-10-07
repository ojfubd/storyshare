class StoriesController < ApplicationController
      def index
        @stories = Story.all.select do |story|
          story.published? || (logged_in? && (current_user == story.user))
        end
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

      def bookmarks
        @bookmark_stories = current_user.bookmark_stories
      end

      def show
        @story = Story.find(params[:id])
        @story.increment!(:views)
      end
    
      def sho_story
        @story = Story.find(params[:id])
        @story.increment!(:views)
      end
      
      def sho_text
        @story = Story.find(params[:id])
        @comments = @story.comments 
      end

      def search
        @stories = @q.result.where(status: 1)# 検索結果を取得
        render :search # 明示的にsearch.html.erbを表示
      end

      def autosearch
        @stories = Story.where("name like ?", "%#{params[:q]}%")
        
        respond_to do |format|
          format.js{ render 'home/autosearch' } 
        end
      end

      private

      def story_params
        params.require(:story).permit(:cover, :cover_cache ,:name, :category,:commit, :body, :place, :era, :character,:theme, :motif, :memo, :status,:summary)
      end

      def set_q
        @q = Story.ransack(params[:q]) # Ransack::Searchオブジェクトを設定(初期化)
      end
end