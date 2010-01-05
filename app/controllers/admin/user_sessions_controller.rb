class Admin::UserSessionsController < AdminController

  skip_filter :require_user, :except => [:destroy, :dashboard]

  
  def show
    redirect_to login_path
  end

  def new
    @user_session = @current_account.user_sessions.new
  end

  def create

    @user_session = @current_account.user_sessions.new(params[:user_session])

    if @user_session.save
      
      return redirect_to_own_site unless current_user_belongs_to_current_account 
      redirect_back_or_default
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = @current_account.user_sessions.find(params[:id])
    @user_session.destroy
    redirect_to root_path

  end 
  
  
  # This is the welcome page
  def dashboard
  
  end


  private 
 
  # We send them back to the page they wanted, or default to sending them to the dashboard page
  def redirect_back_or_default(default = admin_path)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def redirect_to_own_site

    flash[:notice] = "Sorry that is not your site"
    redirect_to login_url(:host => current_user.account.default_url)
  end
  
  # We need to check that the user we have authenticated as
  # belongs the site we're trying to access
  def current_user_belongs_to_current_account
    current_user.account_id == @current_account.id 
  end

end
