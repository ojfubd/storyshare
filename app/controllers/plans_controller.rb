class PlanController < ApplicationController
  def new
    @plan = Plan.new
    @story_id = params[:story_id]
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.story_id = params[:story_id]

    if @plan.save
      redirect_to stories_path(story_id: @plan.story_id)
    else
      render :new
    end
  end

  private

  def plan_params
    params.require(:plan).permit(:theme, :motif, :memo)  
  end
end
