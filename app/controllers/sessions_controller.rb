class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to lists_path
    else
      flash[:errors] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
    flash[:notice] = "Successfully logged out"
  end
end
