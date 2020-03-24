class Property < ApplicationRecord
  belongs_to :user
  has_many :investments
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def percentage_achieved
    total_amount_invested = 0
    self.investments.each do |investment|
      total_amount_invested += investment.amount
    end
    (( total_amount_invested.to_f / amount_to_be_raised.to_f ) * 100)
  end
end
