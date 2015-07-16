class InstagramsController < ApplicationController

  def challenge
    render plain: "#{params["hub.challenge"]}"
  end

  def callback
    photo_data = InstagramDataParser.new(response).get_data_for_photo
    photo_data
    .map {|p| Photo.find_or_create_by(
      insta_id: photo_data[:id], 
      insta_url: photo_data[:link]
      )}
    
    render json: response
  end

  def subscribe
    options ={
      object_id: "#{params['tag']}",
      client_id:"#{ENV['instagram_client_id']}",
      client_secret:"#{ENV['instagram_client_secret']}",
    }
    response = Instagram.create_subscription("tag",'https://weddingsnaps.herokuapp.com/subscription', options)
    render plain: 'ok'
  end
end
