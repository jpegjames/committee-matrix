class SessionsController < ApplicationController
  skip_before_filter :login_required
  
  def create
    member = Member.find_by_email(params[:email])
    if member && member.authenticate(params[:password])
      session[:member_id] = member.id
      session[:member_login_time] = Time.now
      redirect_to root_url, :notice => "Logged in!"
    else
      flash[:notice] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:member_id] = nil
    session[:member_login_time] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
