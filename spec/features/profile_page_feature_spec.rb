require 'spec_helper'

describe "My Items" do 

  before do
    @my_item_name = "White Noise"
    @my_item_category = "book"
    @my_item_description = "The best book ever" 
    @my_item_object = Item.create(name: @my_item_name, category: @my_item_category, description: @my_item_description) #to add something to the DB 
  end

  describe "Given that I visit the items path" do
    before do
      visit items_path
    end

    it "should display the name White Noise" do
      page.should have_content(@my_item_name)
    end

    it "should display the category book" do
      page.should have_content(@my_item_category)
    end 

   it "should display the description" do
      page.should have_content(@my_item_description)
    end 




   end# it "should display the profile picture of the user"
   #  page.should have_content(@user.)
end

describe "My Items" do 

  before do
    @my_item_name = "hammer"
    @my_item_category = "tool"
    @my_item_description = "medium sized" 
    @my_item_object = Item.create(name: @my_item_name, category: @my_item_category, description: @my_item_description) #to add something to the DB 
  end

  describe "Given that I visit the profile path" do
    before do
      visit items_path
    end

    it "should display the name of hammer" do
      page.should have_content(@my_item_name)
    end

    it "should display the category tool" do
      page.should have_content(@my_item_category)
    end 

   it "should display the description" do
      page.should have_content(@my_item_description)
    end 




   end# it "should display the profile picture of the user"
   #  page.should have_content(@user.)
end
 