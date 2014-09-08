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

  def tag_confirmation(user, tagger)
    @user = user
    @greeting = "#{user.username} - You have been tagged by #{tagger.username}!!! MUHUHAHAHAHAHAHAHAHAHAHAHA!!!! >;P"

    mail to: user.email, subject: "You been tagged!"
  end

  def new_follower_notice(user, follower)
    @greeting = "#{user.username}, just thought you'd like to know that #{follower.username} is now following your greatness! You now have #{user.followers.count} followers!"

    mail to: user.email, subject: "Congrats on your new follower!!!"
  end
end
