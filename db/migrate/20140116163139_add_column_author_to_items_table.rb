class AddColumnAuthorToItemsTable < ActiveRecord::Migration
  def change
    add_column :items, :author, :string
  end
end
