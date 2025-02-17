class HomeController < ApplicationController
  before_action :set_user, only: %i[my myedit myupdate]
  skip_before_action :log_in_low, only: :update_read
  def top
      @latest_stories = Story.order(created_at: :desc).limit(10) # 上位10件
      @popular_stories = Story.order(views: :desc).limit(10) 
      @tags_with_story_count = Tag.select('tags.*, COUNT(stories.id) AS stories_count').left_joins(:stories).group('tags.id')
  end
  
  def my
    @count = @user.stories.count
  end
  
  def myedit
    unless current_user.role == "general"
      redirect_to my_path, alert: "このアカウントはアカウント情報を変更できません"
    end
  end

  def mystory
  @user = User.find(params[:id])
  @stories = @user.stories
  end

  def update_read
   current_user.update!(read: true)
   redirect_to root_path
  end
  

  def new_guest
    user = User.guest
   @user = login(user.email, 'A1:iiikdd')
   Rails.logger.debug "Login result: #{@user.inspect}"
   if @user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
   else
    redirect_to root_path, notice: 'ゲストユーザーのログイン失敗しました。'
   end
  end

  def myupdate
    if @user.update(user_params)
      redirect_to my_path, success: "ユーザ変更完了しました" 
    else
      flash.now['danger'] = "ユーザ変更に失敗しました"
      render :my, status: :unprocessable_entity
    end
  end

  private

  def log_in(user)
    session[:user_id] = user.id
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def next_level_threshold(current_count)
    levelList = [1, 2 ,4 ,6 ,9 ,11 ,13]
    levelList.find { |levelList| levelList > current_count } || 'Max Level'
  end

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :avatar_cache)
  end
end
