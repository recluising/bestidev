class AddVisibilityToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :visibility, :integer, :default=>5
  end

  def self.down
    remove_column :products, :visibility
  end
end
