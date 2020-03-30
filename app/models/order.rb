class Order < ApplicationRecord
  belongs_to :user
  belongs_to :investment
  monetize :amount_cents
end
