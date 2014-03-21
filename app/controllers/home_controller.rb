class HomeController < ApplicationController

def index
@items=Item.all
@user=User.all
end

end