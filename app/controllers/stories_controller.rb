class StoriesController < ApplicationController
      def index
          @stories = Story.all.order(created_at: :desc).page(params[:page]).per(10).select do |story|
            story.published? || (logged_in? && (current_user == story.user))
          end
      end
    
      def new
        @story = Story.new
      end
    
      def create
        # データベースに一時保存する処理
        @story = current_user.stories.build(story_params)
        tag_list = params[:story][:tags].split(',') # タグをカンマで分割
        tag_list.uniq! # 重複を削除
        @tags = tag_list.join(',')

        if @story.save
          tag_list.each do |tag_name|
            tag = Tag.find_or_create_by(name: tag_name.strip) # 既に存在するタグならそのオブジェクトを使用、なければ作成
            @story.tags << tag unless @story.tags.include?(tag)
          end
          redirect_to stories_path, notice: '物語が作成されました'
        else
          flash[:error] = @story.errors.full_messages.join(", ")
          render :new
        end
      end
     
      
  

      def edit
        @story = current_user.stories.find(params[:id])
        @tags = @story.tags.map(&:name).join(',')
        render :new
      end
    
      def update
        @story = current_user.stories.build(story_params)
        process_tags if params[:story][:tags].present?
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

      def tag_result
        if params[:tag]
          @tag = Tag.find_by(name: params[:tag]) # タグを取得
          @stories = Story.joins(:tags).where(tags: { name: params[:tag] }).order(created_at: :desc).page(params[:page]).per(10).published
        end
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

      def process_tags
        tag_names = params[:story][:tags].split(',') # タグをカンマで分割
        tag_names.map!(&:strip).uniq! # 余分な空白を削除し、重複を取り除く
        @story.tags = tag_names.map do |name|
          Tag.find_or_create_by(name: name) # 既存のタグがあればそれを使用し、なければ新しく作成
        end
        @story.tag_ids = @story.tags.map(&:id)
      end

      def set_q
        @q = Story.ransack(params[:q]) # Ransack::Searchオブジェクトを設定(初期化)
      end
end