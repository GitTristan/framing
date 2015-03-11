class AuthenticationsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to blanks_path, notice: 'Successfully signed in'
    else
      flash[:error] = 'User could not be authenticated. Please try again.'
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Thank you, come again.'
  end
end
