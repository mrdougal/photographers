module AdminHelper
  
  def busy_image(id='busy')
    image_tag 'admin/icons/busy.gif', :id => id, :style => 'display: none;'
  end
  

  # Only match if we are the current path
  def admin_current_class(url)
    'current' if request.path == url
  end 
  
  def admin_current_or_active_class(url)
    'current' if request.path =~ Regexp.new("#{url}/*")
  end 
  
end
