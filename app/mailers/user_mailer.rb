class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user
    @greeting = "Thanks for signing up, #{@user.username}!"

    mail to: user.email, subject: "Welcome to TwitterClone, #{@user.username}!"
  end
end
