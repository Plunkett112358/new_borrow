class CreateBorrows < ActiveRecord::Migration
  def change
    create_table :borrows do |t|
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
