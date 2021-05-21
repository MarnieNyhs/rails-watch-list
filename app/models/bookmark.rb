class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  has_one_attached :photo

  validates :movie_id, presence: true
  validates :list_id, presence: true
  validates :movie_id, uniqueness: { scope: :list_id }
  validates :comment, presence: true, length: {minimum: 6 }
end
