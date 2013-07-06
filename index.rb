require 'sinatra'
require 'twitter'

get '/' do
  erb :index
end

get '/phone_answers' do
  get_user_tweets("ifbyphone").text
end

def twitter_client
  client = Twitter::Client.new(
    consumer_key: "heF3MKMbjVGmuWSBAfp3SA",
    consumer_secret: "Y16MH3ULDZiqT2XNuag6Ti35w3LdtMMvx8ZPOo4Sn00",
  )
end

def get_user_tweets(username)
  twitter_client.search(username, result_type: "recent").results.first
end
