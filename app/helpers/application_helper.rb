# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def title(msg)
                             
    # We have a new string so that msg isn't effected
    s = String.new(msg.to_s)
    return if s.blank?

    content_for :title do
      
      # Add in a spacer
      s << ' - '
    end
  end
  
  
end
