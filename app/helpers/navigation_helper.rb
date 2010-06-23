module NavigationHelper
  
  
  # Called from the layout
  def nav

    out = []
    out << content_tag(:ul, default_links)
    out << content_tag(:ul, photo_links) if @sets
    out
    
  end
  
  # Creates a link for display in the navigation
  def nav_link(str)
    
    link_to str.to_s.titleize, str, :class => ('current' if active_section? str)
  end
  
  # Returns boolean if the request contains part of the url from the argument
  def active_section?(url)
    request.path =~ Regexp.new("#{url}/*")
  end
  
  # Our default set of links to display in the navigation
  def default_links
    
    defaults = []
    [:about, :contact, :photos].each do |val|
      defaults << content_tag(:li, nav_link(val))
    end
    
    defaults
    
  end
  
  # Links to photo sets
  def photo_links

    return unless @sets

    out = []
    @sets.each do |s|
      out << nav_link(s)
    end
    out
    
  end
  
end