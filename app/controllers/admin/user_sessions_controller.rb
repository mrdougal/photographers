class Admin::UserSessionsController < AdminController

  skip_filter :require_user, :except => [:destroy, :dashboard]

  
  def show
    redirect_to login_path
  end

  def new
    @user_session = UserSession.new
  end

  def create

    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      redirect_back_or_default
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find(params[:id])
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


end
