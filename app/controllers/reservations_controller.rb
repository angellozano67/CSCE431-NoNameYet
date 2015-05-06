class ReservationsController < ApplicationController
    before_action :logged_in_user, only: [:index,:create]
    before_action :verified_user, only: [:index,:create]
    before_action :admin_user, only: [:all,:destroy]
    def index

    end
    def create
        startDate = DateTime.parse(params[:startDate])
        endDate = DateTime.parse(params[:endDate])

        res = Reservation.new
        res.user_id = current_user.id
        res.start_time = startDate.to_time.to_i
        res.end_time = endDate.to_time.to_i
        res.save

        event = {:name => "Vehicle Reservation: #{current_user.name}", :start => params[:startDate], :end => params[:endDate]}
        require 'json'

        render plain: event.to_json
    end
    def all
        @reservations = Reservation.all
    end

    def destroy
        Reservation.find(params[:id]).destroy
        flash[:success] = "Reservation deleted"
        redirect_to '/reservations/all'
    end

    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end
    def verified_user
        unless logged_in? and current_user.verified
            store_location
            flash[:danger] = "You're account is not verified"
            redirect_to "/users/#{current_user.id}"
        end
    end
    def admin_user
        redirect_to(root_url) unless current_user.isadmin?
    end
end
