class UserMailer < ApplicationMailer

  default from: '956152989@qq.com'
 
  def welcome_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
