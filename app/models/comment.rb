class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates :content, presence: true,length: { maximum: 400} # contentが空でないことを確認
end
