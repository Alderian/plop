class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name
      t.text :address
      t.datetime :last_activity
      t.date :registration
      t.boolean :active
      t.string :email
      t.string :phone
      t.string :source
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
