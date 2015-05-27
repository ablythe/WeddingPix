require 'open-uri'
class InstagramApi < ActiveRecord::Base
  include HTTParty
  
  base_uri 'api.instagram.com'

  def self.create_subscription tag
    HTTParty.post("/v1/subscriptions", headers: 
    { "client_id"=> "#{ENV['instagram_client_id']}",
      "client_secret" =>"#{ENV['instagram_client_secret']}",
      'object'=>'tag',
      'aspect'=>'media',
      'object_id'=>"#{tag}",
      'callback_url'=>'http://localhost:3000/subscription' 
      })
  end

  def self.get_image access_token
    HTTParty.get("/v1/tags/mom/media/recent?access_token=#{access_token}")
  end

end