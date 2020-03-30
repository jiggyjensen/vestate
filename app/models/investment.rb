class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  validates :amount, presence: true
  attr_accessor :terms_accepted
  monetize :amount_cents
end
