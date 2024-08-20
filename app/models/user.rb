class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  after_initialize :set_default_avatar, if: :new_record?


  has_many :stories, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_stories, through: :bookmarks, source: :story
  
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: { general: 0, admin: 1 ,guest: 2}

  def level
    levelList = [1,2,4,6,9,11,13]
    story_count = stories.count
    userlevel = 0
    #もしカウントがlevelListが+1される
    #例えばstory_countが5だった場合
    levelList.each do |level|
      if story_count >= level
        userlevel += 1
      else
        break
      end
    end

    userlevel

  end

  def own?(object)
    id == object&.user_id
  end

  def bookmark(story)
    bookmark_stories << story
  end
  
  def unbookmark(story)
    bookmark_stories.destroy(story)
  end
  
  def bookmark?(story)
    bookmark_stories.include?(story)
  end

  private

  def set_default_avatar
    unless self.avatar?
      self.avatar = Rails.root.join("app/assets/images/user.png").open
    end
  end
  def self.guest
      find_or_create_by(email: 'guest@example.com') do |user|
      user.name = 'GuestUser'
      user.password = '0000'
      user.password_confirmation = '0000'
      user.role = 'guest'
  end
end
end