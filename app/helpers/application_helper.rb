# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  
  def title(msg)
                             
    # We have a new string so that msg isn't effected
    s = String.new(msg.to_s)
      
    content_for :title do
      s << ' - ' unless s.blank? # Only string if it's not blank
    end
  end
  
end
