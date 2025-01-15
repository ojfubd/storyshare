class Story < ApplicationRecord
    enum category: {
        経済: 0,
        歴史: 1,
        SF: 2,
        ファンタジー: 3,
        ホラー: 4,
        サスペンス: 5,
        ハードボイルド冒険: 6,
        ミステリー: 7,
        恋愛: 8,
        コメディー: 9,
        その他: 10
      }
    enum status: { draft: 0, published: 1 }
    has_many :comments, dependent: :destroy
    has_many :bookmarks, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :story_tags
    has_many :tags, through: :story_tags
    belongs_to :user
    mount_uploader :cover, CoverUploader

    validates :name,length: { maximum: 30, message: "作品名は30文字以内で入力してください" }
    validate :custom_name_presence
    validates :theme, length: { maximum: 1000, message: "テーマは1000文字以内で入力してください"  }
    validates :motif, length: { maximum: 4000, message: "は4000文字以内で入力してください"  }
    validates :memo, length: { maximum: 4000, message: "は4000文字以内で入力してください"  }
    validates :place, length: { maximum: 2000, message: "は2000文字以内で入力してください" }
    validates :era, length: { maximum: 2000, message: "は2000文字以内で入力してください"  }
    validates :character, length: { maximum: 2000, message: "は2000文字以内で入力してください" }
    validates :body, length: { maximum: 10000, message: "は10000文字以内で入力してください" }
    validates :summary, length: { maximum: 50, message: "は50文字以内で入力してください" }



    def liked_by?(user)
      likes.exists?(user_id: user.id)
    end

    def create_notification_like!(current_user)
      # すでに「いいね」されているか検索
      temp = Notification.where(["visitor_id = ? and visited_id = ? and story_id = ? and action = ? ", current_user.id, user_id, id, 'like'])
      # いいねされていない場合のみ、通知レコードを作成
      if temp.blank?
        notification = current_user.active_notifications.new(
          story_id: id,
          visited_id: user_id,
          action: 'like'
        )
        # 自分の投稿に対するいいねの場合は、通知済みとする
        if notification.visitor_id == notification.visited_id
          notification.checked = true
        end
        notification.save if notification.valid?
      end
    end

    def create_notification_comment!(current_user, comment_id)
      # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
      temp_ids = Comment.select(:user_id).where(story_id: id).where.not(user_id: current_user.id).distinct
      temp_ids.each do |temp_id|
        save_notification_comment!(current_user, comment_id, temp_id['user_id'])
      end
      # まだ誰もコメントしていない場合は、投稿者に通知を送る
      save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
    end
  
    def save_notification_comment!(current_user, comment_id, visited_id)
      # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
      notification = current_user.active_notifications.new(
        story_id: id,
        comment_id: comment_id,
        visited_id: visited_id,
        action: 'comment'
      )
      # 自分の投稿に対するコメントの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end

    def self.ransackable_attributes(auth_object = nil)
      ["body", "category", "character", "cover", "created_at", "era", "id", "id_value", "memo", "motif", "name", "place", "status", "theme", "updated_at", "user_id", "views"]
    end

  private

  def custom_name_presence
    errors.add(:base, "作品名を入力してください") if name.blank?
  end
end
