# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# ActionMailer::Base.smtp_settings = {
#   :user_name => 'jallen.manaloto@gmail.com', # This is the string literal 'apikey', NOT the ID of your API key
#   :password => '	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', # This is the secret sendgrid API key which was issued during API key creation
#   :domain => 'trader.com',
#   :address => 'smtp.sendgrid.net',
#   :port => 587,
#   :authentication => :plain,
#   :enable_starttls_auto => true
# }

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.smtp_settings = {
    address: 'smtp.gmail.com',
    port: 465,
    domain: 'gmail.com',
    user_name: 'developedbyjam',
    password: 'otuzsftfukczarxl',
    authentication: 'plain',
    :ssl => true,
    :tsl => true,
    enable_starttls_auto: true
}
