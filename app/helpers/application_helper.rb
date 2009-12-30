# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def title(msg)
                             
    # We have a new string so that msg isn't effected
    s = String.new(msg.to_s)
    return if s.blank?
      
    content_for :title do
      s << ' - ' unless s.blank? # Only string if it's not blank
    end
  end
  
  
  # This is put into the meta.description tag
  def meta_description(msg)

    # We have a new string so that msg isn't effected
    s = String.new(msg.to_s)
    return if s.blank?
      
    content_for :meta_description do
      s << '\n'
    end
  end
  
  # For when we are paginating
  def pagination_title(set)
    
    return unless set.respond_to?('total_pages')
    "page #{set.current_page} of #{set.total_pages}" if set.total_pages > 1
  end
  
  def default_styles
    %w'reset base plugins/formtastic plugins/formtastic-changes photo_site'
  end
  
end
