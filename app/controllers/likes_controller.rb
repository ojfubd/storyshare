class LikesController < ApplicationController
    def create
        @story = Story.find(params[:story_id])
        @like = current_user.likes.new(story_id: @story.id)
        
        if @like.save
          @story.create_notification_like!(current_user)
        else
            #もし登録できなかった場合
             # 「いいね」が成功した場合の処理
            flash[:notice] = "「いいね」をしました"
            redirect_to @story
        end

        # request.refererでsho_textページのリダイレクトしているためlikesがいいね数が変わらないと思われる
      end
    
      def destroy
        @story = Story.find(params[:story_id])
        @like = current_user.likes.find_by(story_id: @story)
        @like.destroy
      end
end
