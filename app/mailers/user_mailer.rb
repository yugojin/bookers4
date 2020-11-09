class UserMailer < ApplicationMailer
  def user_welcome_mail(user)
    @user = user
	　mail(to: @user.email, subject: 'Welcome to Our Application!')
	　default to: -> { User.pluck(:email) }
  　mail(subject: "everyday Bookers!yay!")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_welcome_mail.subject
  #
end
