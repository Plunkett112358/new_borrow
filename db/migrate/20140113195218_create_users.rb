class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.text :image_url
      t.string :street_address
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
