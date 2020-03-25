class Investment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  attr_accessor :terms_accepted
end
