class ChangeSomeColumnNames < ActiveRecord::Migration
  def change
    # rename_column :borrows, :borrower_id, :user_id
    rename_column :items, :owner_id, :user_id 
  end
end
