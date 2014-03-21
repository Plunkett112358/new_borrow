class Text

def new


# put your own credentials here 
account_sid = 'AC4a05d4da84322fe3089f97cad1d56c51' 
auth_token = '2358485c6fe2fdb81b116dcf6bed6821' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
  :from => '+14012565470',    
})
end 

def call
@client.account.messages.create(
  :from => '+14012565470',
  :to => '+14017432401',
  :body => 'Hey there!'
)
end 

end