class Movie < ApplicationRecord
  before_destroy :check_for_bookmark
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  def check_for_bookmark
    # forbit deletion of bookmark reference exists
  end
end
