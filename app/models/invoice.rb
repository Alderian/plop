class Invoice < ActiveRecord::Base
  belongs_to :customer,:class_name=>"Customer"   #,:foreign_key => "customer_id"
  has_many :products
end
