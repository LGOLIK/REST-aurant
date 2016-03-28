class Menu < ActiveRecord::Base
  has_many :orders
  has_many :parties, through: :orders

  validates :name, :cuisine, presence: true
  validates :price, numericality: true, presence: true
end
