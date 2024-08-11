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
    has_many :comments
    belongs_to :user
    validates :name, presence: true,length: { maximum: 30, message: "は30文字以内で入力してください" }
    validates :theme, length: { maximum: 1000, message: "は1000文字以内で入力してください"  }
    validates :motif, length: { maximum: 4000, message: "は4000文字以内で入力してください"  }
    validates :memo, length: { maximum: 4000, message: "は4000文字以内で入力してください"  }
    validates :place, length: { maximum: 2000, message: "は2000文字以内で入力してください" }
    validates :era, length: { maximum: 2000, message: "は2000文字以内で入力してください"  }
    validates :character, length: { maximum: 2000, message: "は2000文字以内で入力してください" }
    validates :body, length: { maximum: 10000, message: "は10000文字以内で入力してください" }
end
