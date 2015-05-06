class ReservationsController < ApplicationController
    before_action :logged_in_user, only: [:index,:create]
    before_action :verified_user, only: [:index,:create]
<<<<<<< HEAD
<<<<<<< HEAD
    before_action :admin_user, only: [:all]
    before_action :correct_user, only: [:destroy]
=======
>>>>>>> Reservation logic
=======
    before_action :admin_user, only: [:all,:destroy]
>>>>>>> Added admin view for all res' and res deletion
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

<<<<<<< HEAD
<<<<<<< HEAD
        # ADD EVENT TO GOOGLE CALENDAR

        event = {:name => "Vehicle Reservation: #{current_user.name}", :start => res.start_time, :end => res.end_time}
=======
        event = {:name => "Vehicle Reservation: #{current_user.name}", :start => params[:startDate], :end => params[:endDate]}
>>>>>>> Added admin view for all res' and res deletion
        require 'json'

        render plain: event.to_json
    end
    def all
        @reservations = Reservation.all
    end

    def destroy
        Reservation.find(params[:id]).destroy
<<<<<<< HEAD

        # REMOVE EVENT TO GOOGLE CALENDAR

        flash[:success] = "Reservation deleted"
        redirect_to :back
=======
        render plain: startDate.to_time.to_i
>>>>>>> Reservation logic
=======
        flash[:success] = "Reservation deleted"
        redirect_to '/reservations/all'
>>>>>>> Added admin view for all res' and res deletion
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
<<<<<<< HEAD
<<<<<<< HEAD
    def admin_user
        redirect_to(root_url) unless current_user.isadmin?
    end
    def correct_user
        @reservation = Reservation.find(params[:id])
        redirect_to(root_url) unless (current_user.id == @reservation.user_id || current_user.isadmin?)
    end
=======
>>>>>>> Reservation logic
=======
    def admin_user
        redirect_to(root_url) unless current_user.isadmin?
    end
>>>>>>> Added admin view for all res' and res deletion
end
