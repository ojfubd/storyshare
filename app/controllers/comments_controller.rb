class CommentsController < ApplicationController
    def create
      @story = Story.find(params[:story_id])
      @comment = @story.comments.new(comment_params)
      @comment.user = current_user # ユーザーの設定は適宜調整
    
      if @comment.save
        @story.create_notification_comment!(current_user, @comment.id)
        redirect_to sho_text_story_path(@story.id), notice: "コメントが投稿されました"
      else
        redirect_to sho_text_story_path(@story.id), alert: "コメントは１文字以上４００文字以内でお願いします"
      end
    end
    
      def index
        @story = Story.find(params[:story_id])
        @comments = @story.comments
      end

      def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy!
        redirect_to sho_text_story_path, notice: 'Comment was successfully deleted.'
      end
    
      private
    
      def comment_params
        params.require(:comment).permit(:content, :story_id)
      end
end
