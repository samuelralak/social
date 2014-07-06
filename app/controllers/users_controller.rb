class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:success] = "Welcome to the Social Network"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def show
  	begin
  		@user = User.find(params[:id])

  	rescue ActiveRecord::RecordNotFound

  		flash[:notice] = "Could not find user"

  	end
  end

  private

  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation)
  	end
end
