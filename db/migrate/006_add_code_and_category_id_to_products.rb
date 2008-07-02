class AddCodeAndCategoryIdToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :code, :string
    add_column :products, :category_id, :integer
  end

  def self.down
    remove_column :products, :code
    remove_column :products, :category_id
  end
end
