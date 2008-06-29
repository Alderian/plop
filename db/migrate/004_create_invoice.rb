class CreateInvoice < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer  :customer_id
      t.text     :note
      t.datetime :date
      t.string   :state
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :invoices
  end
end
