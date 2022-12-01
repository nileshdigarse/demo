class UserMailer < ApplicationMailer
  default from: 'nileshdigarse2000@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: "nidigarse@bestpeers.com", subject: 'Welcome to Team')
  end
end
