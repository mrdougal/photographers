class SiteController < ApplicationController

  # get /
  def homepage
    @photos = Photo.all
  end

  def about
    # Doesn't do much
  end
  
  def contact
    # Doesn't do much either
  end

end
