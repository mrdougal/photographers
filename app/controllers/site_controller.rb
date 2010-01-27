class SiteController < ApplicationController

  # get /
  def homepage
    photos
  end

  # get /photos
  def photos
    @photos = Photo.paginate :all, :page => params[:page]
  end

  # get /photos/:permalink
  def photo
    @photo = Photo.find_by_permalink! params[:permalink]
  end
  
  # get /photos/tagged/:tag
  def photos_tagged
    
    @tag = params[:tag].rstrip
    @photos = Photo.find_tagged_with @tag
    
    # For pretty display
    @tag.titleize
    
    return render 'photos_tagged_empty' if @photos.empty?
  end
  
  
  def about
    # Doesn't do much
  end
  
  def contact
    # Doesn't do much either
  end

end
