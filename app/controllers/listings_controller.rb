class ListingsController < ApplicationController

  def profile
    @my_listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def index
    # @listings = Listing.all
    if params[:tag] #to do tag based search
      @listings = Listing.tagged_with(params[:tag])
    else
      @listings = Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def edit
    @listing = Listing.find(params[:id])
    if @listing.user == current_user
      render :edit
    else
      redirect_to sign_in_path
    end
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :edit #render back to edit.html.erb   
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    redirect_to myprofile_path
  end

  private

  def listing_params
    # byebug
    params.require(:listing).permit(:title, :description, :all_tags)
  end

end
