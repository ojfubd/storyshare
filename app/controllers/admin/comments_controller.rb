class Admin::CommentsController < Admin::BaseController
    def create
        @story = Story.find(params[:story_id])
        @comment = @story.comments.new(comment_params)
        @comment.user = current_user 

        if @comment.save
          redirect_to admin_story_comments_path(@story.id), notice: "コメントが投稿されました"
        else
          redirect_to admin_story_comments_path(@story.id), alert: "コメントは１文字以上４００文字以内でお願いします"
        end
    end
    
    def index
        @story = Story.find(params[:story_id])
        @comments = @story.comments
    end
    
    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy!
        redirect_to admin_story_comments_path(@comment.story_id), notice: 'コメントが削除されました'
    end
    
      private
    
      def comment_params
        params.require(:comment).permit(:content, :story_id)
      end

  end
  