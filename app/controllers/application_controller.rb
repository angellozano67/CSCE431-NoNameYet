class ApplicationController < ActionController::Base
    before_action :logged_in_user, only: [:reservation]
    def index

    end
    def about

    end
    def contact

    end
    def login

    end
    def reservation

    end
    def newauth    
    
    end
    def createauth
        @auth = request.env['omniauth.auth']['credentials']
        Token.create(
      access_token: @auth['token'],
      refresh_token: @auth['refresh_token'],
      expires_at: Time.at(@auth['expires_at']).to_datetime)
    end
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
	include SessionsHelper
end
