class UserMailer < ApplicationMailer
  default from: 'paul.repain@yahoo.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def follow_email(user)
    @user = user
    @url  = 'localhost:3000'
    mail(to: user.email, subject: 'You are following someone')
  end
end
