class BookmarksController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    current_user.bookmark(@story)
    redirect_to stories_path
  end

  def destroy
    @story = current_user.bookmarks.find(params[:id]).story
    current_user.unbookmark(@story)
    redirect_to stories_path
  end
end
