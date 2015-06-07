class InstagramsController < ApplicationController

  def callback
    render plain: "#{params["hub.challenge"]}"
  end

  def subscribe
    response = InstagramApi.create_subscription params["tag"]
    render json: response
  end
end
