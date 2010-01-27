# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  rescue_from ActiveRecord::RecordNotFound, :with    => :not_found
  rescue_from ActionController::RoutingError, :with  => :not_found
  rescue_from ActionController::UnknownAction, :with => :not_foundend


  # For 404, which can be called via Apache care of it's config
  def not_found
    render :template => 'shared/rescues/not_found', :status => 404 
  end
           
  # For 403, (which will be called via Apache care of it's config)
  def not_allowed
    render :template => 'shared/rescues/not_allowed', :status => 403 
  end

end