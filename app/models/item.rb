class Item < ActiveRecord::Base
  attr_accessible :category, :description, :name, :user_id, :user, :borrowed, :author
  attr_accessor :directions
  belongs_to :user
  ###telling active record to find

  has_many :borrows
  



  def self.search(column, search)
    if column == "name"
      Item.where('name LIKE ?', "%#{search}%")
    else
      Item.where('author LIKE ?', "%#{search}%")
    end
  end
# def self.search(search)

#   results=[]
#   @items=Item.all
#   @items.each do |item|
#     if item.name.downcase.scan(search).empty? == false
#       results << item
#     end 
#   end
#   results
# end


# def self.search_author(search)

#   results=[]
#   @items=Item.all
#   @items.each do |item|
#     if item.author.downcase.scan(search).empty? == false
#       results << item
#     end 
#   end
#   results
# end
  # def borrow_me(borrower)
  #   borrow_record = self.borrows.build(user_id: borrower.id, borrowed: true)
  #   borrow_record.save
  # end

  # def borrower
  #   borrow = self.borrows.find_by_borrowed(true) # give back current borrowed
  #   User.find(borrow.user_id)
  # end

end
