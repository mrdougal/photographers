class Admin::PhotosController < AdminController
  
  before_filter :find_photo, :except => [:index, :new, :create] 
 
 
  # GET /photos
  def index
    
    # For the upload form on the side of the page
    @photo = Photo.new
    @photos = Photo.paginate :all, :page => params[:page]
  end

  # GET /photos/1
  def show
    
    render :partial => 'show' if request.xhr?
    
  end

  # GET /photos/new
  def new

    @photo = Photo.new

    render :partial => 'form' if request.xhr?

  end

  # GET /photos/1/edit
  def edit

    render :partial => 'form' if request.xhr?
  end

  # POST /photos
  def create
    
    @photo = Photo.new(params[:photo])

    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      
      
      if request.xhr?
        render :nothing => true

      elsif uploadify? 

        render :partial => 'photo'
      else
        redirect_to [:admin, @photo.category, @photo.set]
      end
      
    else # Failed upload
      
      if uploadify?
        render :nothing => true
      else
        render :action => "new"
      end
    end
  end

  # PUT /photos/1
  def update
    
    if @photo.update_attributes(params[:photo])
    
      flash[:notice] = "#{@photo} was updated"
      
      if request.xhr?
        render :nothing => true
      else
        redirect_to [:admin, @photo.category, @photo.set]
      end
    else
      render :action => "edit"
    end
  end

  # DELETE /photos/1
  def destroy
    
    
    @photo.destroy
    
    flash[:notice] = "#{@photo} was deleted"
    redirect_to [ :admin, @photo.category, @photo.set]
  end
  
  
  private
  
  def uploadify?
    request.env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/
  end
  
  def find_photo
    @photo = Photo.find(params[:id])
  end
  

  
end
