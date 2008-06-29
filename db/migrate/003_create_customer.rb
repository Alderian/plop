class CreateCustomer < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string   :name
      t.text     :address
      t.string   :phone
      t.string   :email
      t.string   :source
      t.datetime :registered
      t.boolean  :active
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :customers
  end
end
