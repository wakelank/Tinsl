class SessionsController < ApplicationController

  def new
  end

  def create
      if params[:guest] then
          email = "guest@example.com"
          password = "password"
      else
          email = params[:email]
          password = params[:password]
      end
      user = User.find_by(email: email)

      if user && user.authenticate(password)
        session[:user_id] = user.id 
        redirect_to movies_path, notice: "Signed in as #{user.name}."
      else
        redirect_to log_in_path, alert: "Login failed."
      end
  end

  def destroy
      session[:user_id] = nil
      redirect_to log_in_path, notice: "Logged out."
  end
end
