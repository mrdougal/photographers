class Admin::PhotosController < AdminController
 
 
  # GET /photos
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  def show
    @photo = Photo.find(params[:id])
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
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
    @photo = Photo.find(params[:id])
    
    if @photo.update_attributes(params[:photo])
    
      flash[:notice] = 'Photo was successfully updated.'
      redirect_to [:admin, @photo]
    else
      render :action => "edit"
    end
  end

  # DELETE /photos/1
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to admin_photos_url
  end
end
