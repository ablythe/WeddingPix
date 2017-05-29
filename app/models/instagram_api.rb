require 'open-uri'
class InstagramApi < ActiveRecord::Base
  Instagram.configure do |config|
  config.client_id = ENV['instagram_client_id']
  config.client_secret = ENV['instagram_client_secret']
  
end
  
  

  def self.create_subscription tag
    options ={
      object_id: tag
    }
    Instagram.create_subscription("tag",'https://www.weddingsnaps.herokuapp.com/subscription', options)
  end


 


end
