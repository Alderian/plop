class CreateInvoiceItems < ActiveRecord::Migration
  def self.up
    create_table :invoice_items do |t|
      t.integer  :invoice_id
      t.integer  :product_id
      t.string   :description
      t.integer  :quantity
      t.integer  :unit_price
      t.integer  :total
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :invoice_items
  end
end
