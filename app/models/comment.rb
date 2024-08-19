class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :story
  validates :content, presence: true,length: { message: "空欄投稿はやめてください" }
end
