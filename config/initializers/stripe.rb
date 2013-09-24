Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_Orr2yHPG9T8nMubTQZIXqJ7w'],
  :secret_key      => ENV['sk_test_nfRXkPWKQkNJhrBofH0qnxrO']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]