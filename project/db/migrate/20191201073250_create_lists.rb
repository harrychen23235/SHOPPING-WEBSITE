class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :buyer_name
      t.string :address
      t.string :telephone

      t.timestamps
    end
  end
end
