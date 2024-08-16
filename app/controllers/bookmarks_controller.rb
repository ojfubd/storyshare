class BookmarksController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    current_user.bookmark(@story)
  end

  def destroy
    @story = current_user.bookmarks.find(params[:id]).story
    current_user.unbookmark(@story)
  end
end
