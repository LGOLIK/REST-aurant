class Menu < ActiveRecord::Base
  has_and_belongs_to_many :orders

  validates :name, :cuisine, presence: true
  validates :price, numericality: true, presence: true
end
