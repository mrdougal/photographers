class Admin::PhotosController < AdminController
  
  before_filter :find_photo, :except => [:index, :new, :create] 
 
 
  # GET /photos
  def index
    @photos = Photo.paginate :all, :page => params[:page]
  end

  # GET /photos/1
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  def create
    
    @photo = Photo.new(params[:photo])

    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      redirect_to [:admin, @photo]
    else
      render :action => "new"
    end
  end

  # PUT /photos/1
  def update
    
    if @photo.update_attributes(params[:photo])
    
      flash[:notice] = 'Photo was successfully updated.'
      redirect_to [:admin, @photo]
    else
      render :action => "edit"
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
    redirect_to admin_photos_url
  end
  
  
  private
  
  def find_photo
    
    @photo = Photo.find_by_permalink!(params[:id])
    
  end
end
