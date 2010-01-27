# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  # Sets information that will ultimately be displayed in the title tag
  def title(msg)
                             
    # We have a new string so that msg isn't effected
    s = String.new(msg.to_s)
    return if s.blank?

    content_for :title do
      
      # Add in a spacer
      s << ' - '
    end
  end
  
  # For when we are paginating across records. 
  # Ultimately the result will be feed into title, to display in the title tag
  def pagination_title(set)
    
    return unless set.respond_to?('total_pages')
    "page #{set.current_page} of #{set.total_pages}" if set.total_pages > 1
  end
  
  
  
end
