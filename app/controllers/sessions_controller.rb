# encoding: utf-8
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Välkommen " + user.email
    else
      flash.now.alert = "Felaktigt användarnamn eller lösenord"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Utloggad!"
  end
end
