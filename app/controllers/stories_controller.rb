class StoriesController < ApplicationController
      def index
        @stories = Story.all
      end
    
      def new
        @story = Story.new
        @page = params[:page].to_i
      end
    
      def create
        success = false
        @page = 0
          # トランザクションを開始する
        ActiveRecord::Base.transaction do
          begin
            # データベースに一時保存する処理
            @story = Story.new(story_params.merge(user_id: current_user.id))
            if @story.save
              # 保存したストーリーデータを取得し、マージする
              @story.assign_attributes(story_params)
              @page =+ 1
              success = true
            else
            flash[:error] = @story.errors.full_messages.join(", ")
            raise ActiveRecord::Rollback
            end
          rescue => e
            flash[:error] = @story.errors.full_messages.join(", ")
            # ロールバックを明示的に行う
            raise ActiveRecord::Rollback
          end
        end
        if success
          render :new
        else
          render :new
        end
      end
      
  

      def edit
        @story = Story.find(params[:id])
        @page = 0
        render :new

      end
    
      def update
        @story = Story.find(params[:id])
        @story.user = current_user  # ここでUserを設定する
        @page = params[:page].to_i
          success2 = false
              # トランザクションを開始する
          ActiveRecord::Base.transaction do
            begin
              if @story.update(story_params)
                if @page < 3
                  @page += 1
                  success2 = true
                else
                  redirect_to stories_path, notice: 'Story was successfully updated.'
                  return  # 処理を中断するために return する
                end
              else
                flash[:error] = @story.errors.full_messages.join(", ")
                raise ActiveRecord::Rollback
              end
            rescue => e
              flash[:error] = @story.errors.full_messages.join(", ")
              # ロールバックを明示的に行う
              raise ActiveRecord::Rollback
            end
          end
          if success2
            render :new
          else
            render :new
          end
      end


      def destroy
        @story = Story.find(params[:id])
        @story.destroy!
        redirect_to stories_path, notice: 'Story was successfully deleted.'
      end

      def show
        @story = Story.find(params[:id])
      end
    
      def sho_story
        @story = Story.find(params[:id])
      end
    
      def sho_theme
        @story = Story.find(params[:id])
      end
    
      def sho_world_view
        @story = Story.find(params[:id])
      end
    
      def sho_text
        @story = Story.find(params[:id])
      end

      private

      def story_params
        params.require(:story).permit(:name, :category,:commit, :body, :place, :era, :character,:theme, :motif, :memo)
      end

      def in_transaction?
        ActiveRecord::Base.connection.open_transactions > 0
      end

end