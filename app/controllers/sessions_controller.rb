class SessionsController < ApplicationController
  def new
  end
  def create
  	user_email = params[:session][:email]
  	user_password = params[:session][:password]
  	user=User.find_by(email: user_email)
  	if user && user.authenticate(user_password)

  		redirect_to user_url(user)

  	else
  		
  		flash[:danger] = "Email or password is incorrect."
  		render 'new'
    end
  end
end
