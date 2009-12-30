class AdminController < ApplicationController

  layout 'admin'
  before_filter :require_user

  helper_method :logged_in?, :current_user_session, :current_user
  
  # uses_tiny_mce
  
  def not_found
    render :template => 'admin/shared/rescues/not_found', :status => 404 
  end


  private
  
  # AUTHLOGIC METHODS
  
  def logged_in?
    !!@current_user
  end
  
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      record_return_to
      flash[:notice] = "You must be logged in to access this page"
      redirect_to login_path
      return false
    end
  end

  def require_no_user
    if current_user
      # record_return_to
      flash[:notice] = "You must be logged out to access this page"
      redirect_to admin_path
      return false
    end
  end  

  def record_return_to
    session[:return_to] = request.request_uri
  end



end