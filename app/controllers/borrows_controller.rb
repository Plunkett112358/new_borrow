class BorrowsController < ApplicationController


def new
  @new_borrow=Borrow.new
end

def create
  @new_borrow=Borrow.new(params[:borrow])
  @new_borrow.user= current_user
  @new_borrow.item.borrowed = true
  @new_borrow.save
  
  redirect_to views_users_profile_path
end 

def destroy
  @lend = Borrow.find(params[:id]) 
  @lend.destroy

  redirect_to views_users_profile_path
  end


end