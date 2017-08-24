if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['PUBLISHABLE_KEY'],
    secret_key: ENV['SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_KG7H2PBvtY2WLnH3xcKVklCk',
    secret_key: 'sk_test_n5VrPxFI6MBqurMIGRcZ6JCD'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]