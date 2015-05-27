class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def verify
    verify_token = params["hub.verify_token"]
    response = Instagram.meet_challenge(params, verify_token)
    if response
      
    end
  end
end
