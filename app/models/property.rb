class Property < ApplicationRecord
  belongs_to :user
  has_many :investments, dependent: :destroy
  has_many :investors, through: :investments, source: :user
  validates :name, :location, :description, :amount_to_be_raised, presence: true
  has_many_attached :photos
  has_many_attached :documents
  has_many :likes
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
  against: [ :name, :location ],
  using: {
    tsearch: { prefix: true }
  }

  def sum_amount_invested
    total_amount_invested = 0
    self.investments.each do |investment|
      total_amount_invested += investment.amount.to_i
    end
    total_amount_invested
  end

  def percentage_achieved
    ((sum_amount_invested.to_f / amount_to_be_raised.to_f) * 100).round
  end


  def days_left
    (self.end_date.to_date - Date.today.to_date).to_i
  end

  def equity_offered
    (amount_to_be_raised / valuation).to_f
  end

  def ownership_dev
    (1 - equity_offered).to_f
  end

  def crowd_investment
    (equity_offered * percentage_achieved).to_f
  end
end
