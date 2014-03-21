
class UsersController < ApplicationController

def profile
   @items = Item.where(user_id: current_user.id)
  @my_borrows= Borrow.where(user_id: current_user.id)



  @my_lends = Borrow.where( item_id: @items)



  @new_item = Item.new
end

def sms
  recipient_id = params[:id]
  recipient = User.find(recipient_id)
  name=recipient.name
  User.call(recipient.phone)

  redirect_to views_users_profile_path

end

end