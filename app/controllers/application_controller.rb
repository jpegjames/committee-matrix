class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :current_member
  before_filter :login_required
  
  private
  
  def login_required
    if session[:member_login_time] and session[:member_login_time] < 2.hours.ago
      # force logout
      session[:member_id] = nil
      session[:member_login_time] = nil
    else
      session[:member_login_time] = Time.now
    end
    
    if !logged_in?
      redirect_to login_url, :notice => "You must login to continue!"
    end
  end
  
  def logged_in?
    if session[:member_id]
      return true
    else
      return false
    end
  end
  
  def current_member
    @current_member ||= Member.find(session[:member_id]) if session[:member_id]
  end
  helper_method :current_member, :logged_in?
end
