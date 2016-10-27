class ReservationsController < ApplicationController

  before_action :require_login, only:[:new,:create]
  #make sure user sign in first before manage to make reservation under public listings
  def reserved
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      @listing = @reservation.listing
      redirect_to listing_reservation_path(@listing, @reservation)
    else
      render :new
    end
  end

  def index
    @listing = Listing.find(params[:listing_id])
    @reservations = @listing.reservations
  end

  def show
    # @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :listing_id) 
  end
end
