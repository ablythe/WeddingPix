require 'open-uri'
class InstagramApi < ActiveRecord::Base
  Instagram.configure do |config|
  config.client_id = ENV['instagram_client_id']
  config.client_secret = ENV['instagram_client_secret']
  
end
  
  def self.create_subscription tag
    response =Instagram.create_subscription({object: 'tag', callback_url: 'https://www.weddingsnaps.herokuapp.com/subscription', aspect: 'media', object_id: "#{tag}"})
    response
  end


 


end
