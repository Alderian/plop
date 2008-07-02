class AddSupplierCode < ActiveRecord::Migration
  def self.up
    add_column :products, :supplier_code, :string
  end

  def self.down
    remove_column :products, :supplier_code
  end
end
