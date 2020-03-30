class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :saved_properties
  has_many :properties
  has_many :investments
  has_many :orders
  has_many :saved_properties, dependent: :destroy
  has_many :properties, dependent: :destroy
  has_many :investments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_properties, through: :likes, source: :property
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  def investment_sum
    investments.sum do |investment|
      investment.amount
    end
  end
end


