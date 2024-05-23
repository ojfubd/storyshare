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
    has_many :texts
    has_many :view_worlds
    has_many :plots
    has_many :plans
    belongs_to :user
end
