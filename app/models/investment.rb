class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :amount, presence: true
  attr_accessor :terms_accepted
  monetize :amount_cents

  def share_percentage
    ((amount.to_f / property.valuation.to_f) * 100).round
  end
end
