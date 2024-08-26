class Admin::StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update(story_params)
        redirect_to admin_stories_path, notice: 'Story was successfully updated.'
    else
        flash[:error] = @story.errors.full_messages.join(", ")
    end
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy!
    redirect_to admin_stories_path, notice: 'Story was successfully deleted.'
  end

  private

  def story_params
    params.require(:story).permit(:cover, :cover_cache ,:name, :category,:commit, :body, :place, :era, :character,:theme, :motif, :memo, :status)
  end
  

end