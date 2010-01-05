class Admin::UsersController < AdminController

    before_filter :find_user

    def index
      @users = @current_account.users.all
    end
    
    def new
      @user = @current_account.users.new
    end
    
    def create
      @user = @current_account.users.new params[:user]
      if @user.save
        flash[:notice] = "#{@template.link_to @user, admin_user_path(@user)} created..."
        redirect_to admin_users_path
      else
        render :action => 'new'
      end
    end


    def update
      
      if @user.update_attributes(params[:user])
        flash[:notice] = "#{@template.link_to @user, admin_user_path(@user)} was updated"
        redirect_to admin_users_path
      else
        render :template => 'admin/users/edit'
      end
    end 
    
    def edit
      # render :template => 'admin/users/edit'
    end

    def show
      #
    end

    def destroy
      if @user.delete
      redirect_to admin_user_path
      else
        flash[:notice] = @user.errors.full_messages.join(',')
      end
    end
    

    private
    def find_user
      @user = @current_account.users.find(params[:id]) if params[:id]
    end
  
end
