class ChargesController < ApplicationController

  def new
    @charge = Charge.new
  end

  def create
    # Amount in cents
    #@amount = 5000
    @charge = Charge.new(charge_param)
    #@charge.amount = params[:amount]

    customer = Stripe::Customer.create(
      #:email => 'example@stripe.com',
      :card => params[:stripeToken]
    )

    begin
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => (@charge.amount * 1.02).to_i,
        :currency    => 'usd',
        #:card => token,
        :description => 'Math tutee'
      )
      unless charge["failure_message"]
        redirect_to root_url, notice: "Thank you for your payment of $#{charge[:amount]/100}"
      end

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to charges_path
      end
    end

private
  def charge_param
    #params.require('charge').permit(:amount)
    params.fetch(:charge, {})
  end

end
