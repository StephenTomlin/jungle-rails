class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  def order_email(user, order)
    @order = order
    @user = user
    @url = 'localhost:3000/orders'
    mail(to: @user.email, subject: 'successful order from jungle')
  end
end