class PhotosController < ApplicationController

  # get /photos
  def index
    @photos = Photo.paginate :all, :page => params[:page]
  end

  # get /photos/:permalink
  def show
    @photo = Photo.find_by_permalink! params[:permalink]
  end
  
  # get /photos/tagged/:tag
  def tagged
    
    @tag = params[:tag].rstrip
    @photos = Photo.paginate_tagged_with @tag , :page => params[:page] 
    
    # For pretty display
    @tag.titleize
    
    # If we don't have anything to show, we'll render the empty page
    return render 'tagged_empty' if @photos.empty?
  end
  
  # get /photos/sets/:permalink
  def set
    
    # Clear out any excess whitespace
    @set = params[:permalink].rstrip
    
    # We don't support this just now
    return render 'set_empty'
    
  end

end