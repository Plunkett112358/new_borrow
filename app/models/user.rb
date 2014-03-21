class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :bio, :city, :image_url, :name, :password, :state, :street_address, :phone

  has_many :items
  has_many :borrows

  devise :omniauthable, :omniauth_providers => [:facebook]


def self.call(recipient)
account_sid = 'AC4a05d4da84322fe3089f97cad1d56c51' 
auth_token = '2358485c6fe2fdb81b116dcf6bed6821' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
  :from => '+14012565470',    
  :to => "+1#{recipient}",
  :body => "Pleased be advised that you have borr.owed a book and if you do not finish reading it soon, we will start sending you plot spoilers and passive aggressive notes. Love, Borr.ow the Book Tracking App!"
})

  end 



def full_address

  "#{self.street_address} #{self.city} #{self.state}"

end

# Find facebook authorization
  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  # assuming the user model has a name
      user.save!
    end
  end
#AND THIS##############
  # Login user in if they already have a session
  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
