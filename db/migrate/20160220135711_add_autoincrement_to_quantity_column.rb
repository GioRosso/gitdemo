class AddAutoincrementToQuantityColumn < ActiveRecord::Migration
  def change
      change_column :products, :quantity, :integer, default: 1
  end
end
