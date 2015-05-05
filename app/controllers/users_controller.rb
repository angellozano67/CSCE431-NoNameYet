class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :admin_user, only: [:destroy, :index]
  #before_action :verified_user, only: 

  # GET /users/
  def index
	@users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
	@user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end
  # GET /users/1/edit
  #def edit
  #end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
	if @user.save
		log_in @user
		flash[:success] = "Welcome to the BVCIL App!"
		redirect_back_or @user
	else
		render 'new'
	end
  end
  
  # POST /users/1
  def update
	@user = User.find(params[:id])
	if @user.update_attributes(user_params)
		flash[:success] = "Profile updated."
		redirect_to @user
	else
		render 'edit'
	end
  end
  
  # DELETE /users/1
  def destroy
	User.find(params[:id]).destroy
	flash[:success] = "User deleted"
	redirect_to users_url
  end
  
  # GET /users/1/edit
  def edit
	@user = User.find(params[:id])
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :verified, :notes, :address, :organization, :insuranceprovider, :policynum)
    end
	
	def verified_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless (current_user.verified?)
	end
	
	def logged_in_user
		unless logged_in?
			store_location
			flash[:danger] = "Please log in."
			redirect_to login_url
		end
	end
	
	def correct_user
		@user = User.find(params[:id])
		redirect_to(root_url) unless (current_user?(@user) || current_user.isadmin?)
	end
	
	def admin_user
		redirect_to(root_url) unless current_user.isadmin?
	end
end
