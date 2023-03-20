class OffersController < ApplicationController
  before_action :signed_in_user?

  def home
    if cookies[:eligible_only] == "true"
      @offers = current_user.eligible_offers
    else
      @offers = Offer.all
    end
  end

  def show
    @offer = Offer.find_by(id: params[:id])
    if @offer.nil?
      redirect_to root_path, alert: 'Offer not found'
    end
  end

  private

  def signed_in_user?
    unless signed_in?
      store_location
      redirect_to signin_url
    end
  end
end
