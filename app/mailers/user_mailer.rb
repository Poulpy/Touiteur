class UserMailer < ApplicationMailer
  default from: 'paul.repain@yahoo.com'
 
  def welcome_email
    @user = current_user
    @url  = 'localhost:3000/users/sign_up'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
