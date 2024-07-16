class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader
  after_initialize :set_default_avatar, if: :new_record?

  has_many :stories
  
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  enum role: { general: 0, admin: 1 }

  private

  def set_default_avatar
    unless self.avatar?
      self.avatar = Rails.root.join("app/assets/images/user.png").open
    end
  end
  def self.guest
      find_or_create_by(email: 'guest@example.com') do |user|
      user.password = '0000'
      user.password_confirmation = '0000'
  end
end
end
