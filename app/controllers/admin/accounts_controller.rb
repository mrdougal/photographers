class Admin::AccountsController < AdminController

  # GET /accounts/1
  def show
  end

  # GET /accounts/1/edit
  def edit
  end

  # PUT /accounts/1
  def update

    if @current_account.update_attributes(params[:account])
      flash[:notice] = 'Your account was successfully updated.'
      redirect_to admin_account_path
    else
      render :action => "edit"
    end
  end

  
end
