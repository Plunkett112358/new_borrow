class Borrow < ActiveRecord::Base
  attr_accessible :item_id, :user_id, :item, :user

  belongs_to :item 
  belongs_to :user
  


 

end
