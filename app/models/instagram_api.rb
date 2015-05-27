require 'open-uri'
class InstagramApi < ActiveRecord::Base
  Instagram.configure do |config|
  config.client_id = ENV['instagram_client_id']
  config.client_secret = ENV['instagram_client_secret']
  # For secured endpoints only
  #config.client_ips = '<Comma separated list of IPs>'
end
  
  def self.create_subscription tag
    response = Instagram.create_subscription({object: 'tag', callback_url: 'http://www.example.com/subscription', aspect: 'media', object_id: "#{tag}"})
    response
  end


 


end
