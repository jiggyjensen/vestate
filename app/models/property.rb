class Property < ApplicationRecord
  belongs_to :user
  has_many :investments
  validates :user, uniqueness: true
  validates :name, :location, :description, presence: true
  has_one_attached :photo
end
