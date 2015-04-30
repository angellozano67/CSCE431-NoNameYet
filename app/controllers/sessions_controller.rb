class SessionsController < ApplicationController
	
	def new
	end
	
	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			# Log in and redirect
			log_in user
			redirect_to user
		else
			# error message
			flash.now[:danger] = 'Invalid email/password combination'
			render 'new'
		end
	end
	
	def destroy
		log_out
		redirect_to root_url
	end
	
end