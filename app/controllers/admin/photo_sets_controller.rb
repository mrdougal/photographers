class Admin::PhotoSetsController < AdminController

	before_filter :new_photo
  before_filter :find_category
  before_filter :find_set, :except => [:index, :create, :new] 
  
  def index
    redirect_to [:admin, @category]
  end
  
  def new
    @set = PhotoSet.new
  end
  
  def create
    
    @set = @category.photo_sets.new(params[:photo_set])

    if @set.save
      flash[:notice] = 'Set was successfully created.'
      
      if request.xhr?
        render :nothing => true
      else
        redirect_to [:admin, @category, @set]
      end
    else # Failed creation
      
      render :action => "new"
    end
    
  end

  def show
    
  end

  def edit
    
  end
  
  def update
    
    if @set.update_attributes(params[:photo_set])
    
      flash[:notice] = 'Set was successfully updated.'
      
      if request.xhr?
        render :nothing => true
      else
        redirect_to [:admin, @category, @set]
      end
    else
      render :action => "edit"
    end 
  end
  
  def destroy
    
    if @set.destroy
      flash[:notice] = "Deleted #{@set}"
      redirect_to [:admin, @category]
    else
      flash[:warning] = @category.errors
      render :action => :show
    end
  end

  

  private
  
  def new_photo
    # So that we can perform photo uploads
    @photo = Photo.new
  end

  def find_category
    @category = Category.find(params[:category_id]) if params[:category_id]
  end
  
  def find_set
    @set = @category.sets.find(params[:id]) if params[:id]
  end
  

end