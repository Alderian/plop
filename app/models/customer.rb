class Customer < ActiveRecord::Base
  validates_uniqueness_of :name, :message => "must be unique"
  validates_presence_of :name, :message => "can't be blank"
end
