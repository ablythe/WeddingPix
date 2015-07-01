class InstagramsController < ApplicationController

  def callback
    render plain: "#{params["hub.challenge"]}"
  end

  def subscribe
    options ={
      object_id: "#{params['tag']}",
      client_id:"#{ENV['instagram_client_id']}",
      client_secret:"#{ENV['instagram_client_secret']}",
    }
    response = Instagram.create_subscription("tag",'https://weddingsnaps.herokuapp.com/subscription', options)
    render json: response
  end
end
