class Order < ActiveRecord::Base
 has_many :user
 has_many :menus
 has_many :parties

end
