class Bookmark < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true   # ← この1行を追加
end
