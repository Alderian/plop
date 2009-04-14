require 'money'
class Product < ActiveRecord::Base

  composed_of :buy_price, :class_name => "Money", :mapping => [%w(buy_price_in_cents buy_price_in_cents), %w(currency currency)]
  

end
