class UserMailer < ApplicationMailer
  default from: '99catzadmin@99cats.com'

  def welcome_email(user)
    @user = user
    mail(to: user.username+"@gmail.com", subject: 'Welcome to catlandia')
    @link = root_url
  end
end
