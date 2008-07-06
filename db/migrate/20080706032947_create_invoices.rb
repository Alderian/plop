class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :customer_id
      t.integer :user_id
      t.string :customer
      t.decimal :total,:precision => 8, :scale => 2
      t.string :state,:default =>"new"
      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
