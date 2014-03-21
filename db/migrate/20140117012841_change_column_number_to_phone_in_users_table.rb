class ChangeColumnNumberToPhoneInUsersTable < ActiveRecord::Migration
  def up
    remove_column :users, :number
    add_column :users, :phone, :string 
  end

  def down
    remove_column :users, :phone
    add_column :users, :number, :string  
  end
end
