require 'open-uri'
class InstagramApi < ActiveRecord::Base
  Instagram.configure do |config|
  config.client_id = ENV['instagram_client_id']
  config.client_secret = ENV['instagram_client_secret']
  
end
  
  def self.create_subscription tag
    
    response =HTTParty.post('https://api.instagram.com/v1/subscriptions/', 
      body:{
        client_id:"#{ENV['instagram_client_id']}",
        client_secret:"#{ENV['instagram_client_secret']}",
        object:'tag',
        object_id:"#{tag}",
        aspect:'media',
        callback_url:'https://www.weddingsnaps.herokuapp.com/subscription'
        })
    binding.pry
  end


 


end
