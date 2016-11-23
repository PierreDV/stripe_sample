class ChargesController < ApplicationController
  def new
    # this will remain empty unless you need to set some instance variables to pass on
  end

  def create
    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here: https://dashboard.stripe.com/account/apikeys
    Stripe.api_key = "sk_test_rXviLnOHrnBCY96QkMHPkVsO"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]

    # Create a charge: this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => 1000, # Amount in cents
        :currency => "cad",
        :source => token,
        :description => "Example charge"
      )
    rescue Stripe::CardError => e
      # The card has been declined
    end

  end
end
