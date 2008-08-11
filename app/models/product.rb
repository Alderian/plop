class Product < ActiveRecord::Base
  money :buy_price,:currency=>false
end
