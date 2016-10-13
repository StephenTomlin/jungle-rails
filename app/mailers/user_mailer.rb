class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  def order_email(user)
    @user = user
    @url = 'localhost:3000/orders'
end