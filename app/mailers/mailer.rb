class Mailer < ActionMailer::Base

  default from: "noreply@thehartmangallery.com"

  def order_notification(order)
    @order = order
    mail to: "David <david@nyconrails.com>", subject: "New Order and Purchase"
  end

  def inquiry_notification(inquiry)
    @inquiry = inquiry
    mail to: "David <david@nyconrails.com>", subject: "New Inquiry"
  end

end
