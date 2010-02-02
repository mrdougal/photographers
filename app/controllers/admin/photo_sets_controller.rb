class Admin::PhotoSetsController < AdminController

  before_filter :find_photo_set, :except => [:index, :new, :create ] 
  
  # get /admin/photo_set
  def index
    @photo_sets = PhotoSet.paginate :all, :page => params[:page] 
  end
  
  
  def new
    @photo_set = PhotoSet.new
  end
  
  # POST /photos
  def create
    
    @photo_set = PhotoSet.new(params[:photo_set])

    if @photo_set.save
      flash[:notice] = 'Set was successfully created.'
      redirect_to [:admin, @photo_set]
    else
      render :action => "new"
    end
  end

  def show
    
  end
  
  def update

    if @photo_set.update_attributes(params[:photo_set])
    
      flash[:notice] = 'Set was successfully updated.'
      redirect_to [:admin, @photo_set]
    else
      render :action => "edit"
    end
  end


  
  
  private

  def find_photo_set
    @photo_set = PhotoSet.find_by_permalink!(params[:id]) if params[:id]
  end

end