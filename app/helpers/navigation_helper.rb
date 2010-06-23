module NavigationHelper
  
  
  # Called from the layout
  def nav

    out = []
    out << content_tag(:ul, default_links)
    out << content_tag(:ul, photo_links, { :class => "categories" }) if @sets
    out
    
  end
  
  # Creates a link for display in the navigation
  def nav_link(str, path = '')
    
    url = [path, str.to_s.downcase].join('/')

    content_tag :li do
      link_to str.to_s.titleize, url, :class => ('current' if active_section? url)
    end
  end
  
  # Returns boolean if the request contains part of the url from the argument
  def active_section?(url)
    request.path =~ Regexp.new("#{url}/*")
  end
  
  # Our default set of links to display in the navigation
  def default_links
    
    out = []
    [:about, :contact, :photos].each do |val|
      out << nav_link(val)
    end
    out
    
  end
  
  # Links to photo sets
  def photo_links

    return unless @sets

    out = []
    @sets.each do |s|
      out << nav_link(s, '/photos')
    end
    out
    
  end
  
end