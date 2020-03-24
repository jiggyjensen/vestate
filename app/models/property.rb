class Property < ApplicationRecord
  belongs_to :user
  has_many :investments
  validates :user, uniqueness: true
  validates :name, :location, :description, presence: true
  has_one_attached :photo
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
  against: [ :name, :location ],
  using: {
    tsearch: { prefix: true }
  }
end
