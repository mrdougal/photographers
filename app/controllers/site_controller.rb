class SiteController < ApplicationController

  # get /
  def homepage
    
  end

  # get /categories
  def categories
    
  end
  
  # get /categories/:permalink
  def category
    
  end
  
  # get /sets
  def sets
    
  end

  # get /sets/:permalink
  def set
    
  end

  # get /photos
  def photos
    @photos = @current_account.photos
  end

  # get /photos/:permalink
  def photo
    @photo = @current_account.photos.find_by_permalink! params[:permalink]
  end
  
  
  
  
  # For 404, which can be called via Apache care of it's config
  def not_found
    render :template => 'shared/rescues/not_found', :status => 404 
  end
           
  # For 403, (which will be called via Apache care of it's config)
  def not_allowed
    render :template => 'shared/rescues/not_allowed', :status => 403 
  end
  

  private

end