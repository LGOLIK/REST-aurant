class Order < ActiveRecord::Base
 has_many :users
 has_many :menus
 has_many :parties

end
