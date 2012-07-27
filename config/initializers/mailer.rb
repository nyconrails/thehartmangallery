ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "hg.alechartman.com",
  :user_name            => "do-not-reply@nyconrails.com",
  :password             => "outboundemail",
  :authentication       => "plain",
  :enable_starttls_auto => true
}