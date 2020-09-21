class UserMailer < ApplicationMailer
  default from: "ssdog27@gmail.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Projects!")
  end
end
