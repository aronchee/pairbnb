class UsersController < ApplicationController

  def show
  	# byebug
  	@user = User.find(params[:id])
  	@listings = @user.listings
  	@reservations = @user.reservations
  end

end
