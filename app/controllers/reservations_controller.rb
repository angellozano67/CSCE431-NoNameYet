class ReservationsController < ApplicationController
    before_action :logged_in_user, only: [:index,:create]
    before_action :verified_user, only: [:index,:create]
    before_action :admin_user, only: [:all]
    before_action :correct_user, only: [:destroy]
    def index

    end
    def create
        startDate = DateTime.parse(params[:startDate])
        endDate = DateTime.parse(params[:endDate])

        require 'pp'
        # ADD EVENT TO GOOGLE CALENDAR
         client = Google::APIClient.new
         client.authorization.access_token = Token.last.fresh_token
         service = client.discovered_api('calendar', 'v3')
         calEvent = {
         "start":
         {
          "dateTime": params[:startDate]
         },
         "end":
         {
          "dateTime": params[:endDate]
         },
         "summary": "Vehicle Reservation: #{current_user.name}"
         }
       result = client.execute(
         :api_method => service.events.insert,
         :parameters => {'calendarId' => ENV['GCAL_URL']},
         :body => JSON.dump(calEvent),
         :headers => {'Content-Type' => 'application/json'})
       response = pp JSON.parse(result.body)

       res = Reservation.new
       res.user_id = current_user.id
       res.start_time = startDate.to_time.to_i
       res.end_time = endDate.to_time.to_i
       res.gcal_eventId = response['id']
       res.save
       event = {:name => "Vehicle Reservation: #{current_user.name}", :start => res.start_time, :end => res.end_time}


        # require 'json'

        # render plain: response
        render plain: event.inspect
    end
    def all
        @reservations = Reservation.all
    end

    def destroy
        res = Reservation.find(params[:id])
        # REMOVE EVENT TO GOOGLE CALENDAR
        client = Google::APIClient.new
        client.authorization.access_token = Token.last.fresh_token
        service = client.discovered_api('calendar', 'v3')
        result = client.execute(
          :api_method => service.events.delete,
          :parameters => {'calendarId' => ENV['GCAL_URL'], 'eventId' => res.gcal_eventId},
          :headers => {'Content-Type' => 'application/json'})
        # response = pp JSON.parse(result.body)

        Reservation.find(params[:id]).destroy

        flash[:success] = "Reservation deleted"
        redirect_to :back

        # render plain: response.inspect
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
    def correct_user
        @reservation = Reservation.find(params[:id])
        redirect_to(root_url) unless (current_user.id == @reservation.user_id || current_user.isadmin?)
    end
end
