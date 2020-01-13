class AddOrderRefToLists < ActiveRecord::Migration[5.2]
  def change
    add_reference :lists, :order, foreign_key: true
  end
end
