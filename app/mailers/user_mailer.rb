class UserMailer < ApplicationMailer
    default from: "alyoshka5000@gmail.com"

    def welcome_email
        @user = params[:user]
        @url = new_user_session_url
        mail(to: @user.email, subject: "Welcome to Facebook")
    end
end
