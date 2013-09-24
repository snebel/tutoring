class StaticPagesController < ApplicationController

  def home
  end

  def about
  end

  def rates
  end

  def faq
  end

  def testimonials
  end

  def payments
  end


def new
end
# Set your secret key: remember to change this to your live secret key in production
# See your keys here https://manage.stripe.com/account
Stripe.api_key = "sk_test_nfRXkPWKQkNJhrBofH0qnxrO"

# Get the credit card details submitted by the form
token = params[:stripeToken]

# Create the charge on Stripe's servers - this will charge the user's card
begin
  charge = Stripe::Charge.create(
    :amount => 1000, # amount in cents, again
    :currency => "usd",
    :card => token,
    :description => "payinguser@example.com"
  )
rescue Stripe::CardError => e
  # The card has been declined
end
end
