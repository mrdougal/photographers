class Admin::CategoriesController < AdminController
	
	before_filter :new_photo
  before_filter :find_category, :except => [ :index, :new, :create]
  

  def index
    @categories = Category.paginate :all, :page => params[:page]
  end
  
  def new
    @category = Category.new
  end
  
  def create
    
    @category = Category.new(params[:category])

    if @category.save
      flash[:notice] = "#{@category} was created"
      
      if request.xhr?
        render :nothing => true
      else
        redirect_to [:admin, @category]
      end
    else # Failed creation
      
      render :action => "new"
    end
  end
  
  def show
    @photos = @category.photos
  end

  def edit
    
  end
  
  def update
    
    if @category.update_attributes(params[:category])
    
      flash[:notice] = 'Category was successfully updated.'
      
      if request.xhr?
        render :nothing => true
      else
        redirect_to [:admin, @category]
      end
    else
      render :action => "edit"
    end
  end
  
  def destroy
    
    if @category.destroy
      flash[:notice] = "#{@category} was deleted"
      redirect_to admin_categories_url
    else
      flash[:warning] = "#{@category.errors}"
      render :action => "show" 
    end
  end



  private
  
  def find_category
    @category = Category.find_by_permalink!(params[:id]) if params[:id]
  end
  
  def new_photo
    # So that we can perform photo uploads
    @photo = Photo.new
  end
  
end