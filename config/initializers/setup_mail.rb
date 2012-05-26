ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.perform_deliveries = true
  
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'fortumo.test@gmail.com',
  :password             => 'fortumo123',
  :authentication       => 'plain',
  :enable_starttls_auto => true  
}

if Rails.env.production?
  #
else
  ActionMailer::Base.default_url_options[:host] = "localhost:3000"
end
