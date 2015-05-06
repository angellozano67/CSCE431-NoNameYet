class ReservationsController < ApplicationController
    before_action :logged_in_user, only: [:index,:create]
    def index

    end
    def create

    end
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
end
