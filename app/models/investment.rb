class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :amount, presence: true
  validate :invest_amount_less_than_amount_to_be_raised
  attr_accessor :terms_accepted
  monetize :amount_cents

  def share_percentage
    ((amount.to_f / property.valuation.to_f) * 100).round
  end



  def invest_amount_less_than_amount_to_be_raised
    if amount + property.sum_amount_invested > property.amount_to_be_raised
      errors.add(:amount, "can't exceed amount to be raised on property")
    end
  end

end
