require "driving_directions"

class ItemsController < ApplicationController


  def index
  end

  def search

  end

  def create
  new_item = Item.new(params[:item])

  current_user.items << new_item

  redirect_to views_users_profile_path
  end 


  def category
    @all = Item.all 
    @new_borrow=Borrow.new
    @item = Item.new


        @all.each do |all|
        all.directions = DrivingDirections.go!(start: current_user.full_address, ending: all.user.full_address)
      end
      #@items = Item.all.group_by(&:category)
  end

   def searchresult
      @result = Item.search("name", params[:name])
      @all = Item.all 
      @new_borrow=Borrow.new
      @item = Item.new


      ######## API #########
      @result.each do |result|
        result.directions = DrivingDirections.go!(start: current_user.full_address, ending: result.user.full_address)
      end
    
    end

  def destroy
  @item = Item.find(params[:id]) 
  @item.destroy

  redirect_to views_users_profile_path
  end
  
  



end