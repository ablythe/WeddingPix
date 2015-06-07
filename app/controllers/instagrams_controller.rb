class InstagramsController < ApplicationController

  def callback
    render plain: "#{params["hub.challenge"]}"
  end

  def subscribe

  end
end
