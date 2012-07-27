class Mailer < ActionMailer::Base

  default from: "noreply@thehartmangallery.com"

  def order_notification(order)
    @order = order
    mail to: "Don Hartman <don@donhartman.com>", subject: "New Order and Purchase"
  end

  def inquiry_notification(inquiry)
    @inquiry = inquiry
    mail to: "Don Hartman <don@donhartman.com>", subject: "New Inquiry"
  end

end
