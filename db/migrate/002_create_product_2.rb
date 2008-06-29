class CreateProduct2 < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string   :name
      t.integer  :stock
      t.decimal  :price, :precision => 8, :scale => 2
      t.boolean  :available
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :products
  end
end
