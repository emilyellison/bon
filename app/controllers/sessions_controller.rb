class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_back_or user
    else
      # Create an error message and re-render the sign-in form.
      flash.now[:error] = 'Invalid e-mail/password combination.'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    flash[:success] = 'Come back when you need another beer.'
    redirect_to root_path
  end
  
end
