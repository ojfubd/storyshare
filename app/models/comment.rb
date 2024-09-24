class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story
  has_many :notifications, dependent: :destroy
  validates :content, presence: true,length: { maximum: 400} # contentが空でないことを確認
end
