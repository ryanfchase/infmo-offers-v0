class UserOffersController < ApplicationController
  def create
    # First validate that the offer exists
    @offer = Offer.find_by(id: params[:id])
    if @offer.nil?
      redirect_to root_path, alert: 'Offer not found'
    end

    # Then validate that the user is eligible for the offer
    unless @offer.eligible?(current_user)
      redirect_to root_path, alert: 'You are not eligible for this offer'
    else
      # Then attempt to create the user_offer
      @user_offer = current_user.user_offers.build(:offer_id => params[:id])
      if @user_offer.save
        puts "user offer can be created: #{@user_offer}"
        redirect_to @offer, notice: 'Offer claimed successfully!'

      else
        puts "user_offer_failed: #{@user_offer.errors.full_messages}"
        redirect_to @offer, alert: 'Failed to claim offer'
      end
    end
  end
end
