# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  helper_method :current_user

  before_filter :set_user
  
  
protected

  def current_user
    @current_user
  end

  def set_user
    @current_user = User.find_by_user_hash(params[:user_hash])
  end
  
end
