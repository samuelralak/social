class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	begin
  		@user = User.find(params[:id])

  	rescue ActiveRecord::RecordNotFound

  		flash[:notice] = "Could not find user"

  	end
  end
end
