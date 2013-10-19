class ChargesController < ApplicationController

  def new
  end

  def create
    # Amount in cents
    @amount = 5000
    Stripe.api_key = "sk_test_nfRXkPWKQkNJhrBofH0qnxrO"
    token = params[:stripeToken]

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    begin
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :currency    => 'usd',
        :card => token,
        :description => 'Rails Stripe customer'
      )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to charges_path
    end
  end
end
