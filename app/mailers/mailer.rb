class Mailer < ActionMailer::Base

  default from: "noreply@thehartmangallery.com"

  def order_notification(order)
    @order = order
    logger.debug @order.to_yaml
    mail to: "David <david@nyconrails.com>", subject: "New Order and Purchase"
  end


end
