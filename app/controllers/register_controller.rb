class RegisterController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	
	# GET /users
	# GET /users.json
	def index
	end
	
	# GET /users/success
	def success
	end
	
	# POST /users
	# POST /users.json
	def create
		@user = User.new(user_params)
		
		respond_to do |format|
			if @user.save
				format.html { redirect_to @user, notice: 'User successfully created.' }
				format.json { render :success, status: :created, location: @user }
			else
				format.html { render :index }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	private
		# Use callbacks to share common setup or constraints between actions.
		def set_user
		  @user = User.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def user_params
		  params.require(:user).permit(:name, :email)
		end
end