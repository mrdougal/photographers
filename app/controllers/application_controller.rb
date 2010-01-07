# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base

  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password

  rescue_from ActiveRecord::RecordNotFound, :with    => :not_found
  rescue_from ActionController::RoutingError, :with  => :not_found
  rescue_from ActionController::UnknownAction, :with => :not_found 
  
  
  # We need to load up their account, based on their domain
  before_filter :set_current_account
  
  private
  
  def set_current_account
    @current_account = Account.find_by_domain!(request.domain) #unless request.subdomains.empty?
  end
  
end
