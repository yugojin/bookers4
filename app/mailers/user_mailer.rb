class UserMailer < ApplicationMailer
def send_signup_email(user)
    @user = user
    mail to: @user.email, subject: "会員登録が完了しました。"
end
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.user_welcome_mail.subject
  #
end
