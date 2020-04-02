class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :saved_properties, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :investments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_properties, through: :likes, source: :property
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  def investment_sum
    investments.sum do |investment|
      investment.amount.to_i
    end
  end

  def amount_raised
    sum = 0
    properties.each do |property|
      sum += property.sum_amount_invested
    end
    sum
  end
end


