class User < ActiveRecord::Base
  # has_and_belongs_to_many :orders

  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
  validates :empl_type, inclusion: { in: ["Manager", "Server", "Chef"]}
  has_secure_password
end
