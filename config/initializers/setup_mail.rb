require 'development_mail_interceptor.rb'

ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "student.andover.edu",
  :user_name            => "techmasterswork",
  :password             => "happycrazy17-",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?