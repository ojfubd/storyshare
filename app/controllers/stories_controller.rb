class StoriesController < ApplicationController
      def index
        @stories = Story.all
      end
    
      def new
        @story = Story.new
        @story.texts.build
        @story.view_worlds.build
        @story.plots.build
        @story.plans.build
      end
    
      def create
        @story = Story.new(story_params)
        @story.user = current_user # 現在のユーザーを関連付ける

        if params[:commit] == "次へ"
            if @story.save
                redirect_to plan_story_path(id: @story.id)
            else
                Rails.logger.info @story.errors.full_messages
                flash.now[:alert] = "保存できませんでした"
                render :new
            end
        elsif params[:commit] == "下書き保存"
            if @story.save
                redirect_to stories_path
            else
                flash.now[:alert] = "保存できませんでした"
                render :new
            end
        end
      end

      def edit
        @story = Story.find(params[:id])
      end
    
      def update
        @story = Story.find(params[:id])
        if @story.update(story_params)
          redirect_to edit_story_path(@story)
        else
          render :edit
        end
      end

      def plot
        @story = Story.find(params[:id])
      end
    
      def plan
        @story = Story.find(params[:id])
      end
    
      def worldview
        @story = Story.find(params[:id])
      end
    
      def text
        @story = Story.find(params[:id])
      end
    
      private

      def story_params
        params.require(:story).permit(:name, :category,:commit, texts_attributes: [:body], view_worlds_attributes: [:place, :era, :character, :others], plots_attributes: [:beginning, :development, :turn, :conclusion], plans_attributes: [:theme, :motif, :memo])
      end
end