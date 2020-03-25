class Property < ApplicationRecord
  belongs_to :user
  has_many :investments
  validates :user, uniqueness: true
  validates :name, :location, :description, presence: true
  has_one_attached :photo
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
  against: [ :name, :location ],
  using: {
    tsearch: { prefix: true }
  }

  def percentage_achieved
    total_amount_invested = 0
    self.investments.each do |investment|
      total_amount_invested += investment.amount
    end
    (( total_amount_invested.to_f / amount_to_be_raised.to_f ) * 100)
  end

  def days_left
    (self.end_date.to_date - Date.today.to_date).to_i
  end

end
