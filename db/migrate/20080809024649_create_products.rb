class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.string :factory_code
      t.string :short_code
      t.text :description
      t.integer :stock
      t.integer :min_stock
      t.integer :buy_price_in_cents,:default =>0
      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
