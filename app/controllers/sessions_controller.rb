class SessionController < ApplicationController
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    
    if user && user.authenticate(params[:session][:email])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)      
    else
      flash.now[:danger] = "Login error" 
    end
  end
  
  def destroy
    flash[:success] = "You have logged out"
    redirect_to root_path    
  end
end