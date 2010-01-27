


if ['development','test'].member? Rails.env
  
  # Because ImageMagick is installed in a different place on my dev/testing box
  # We're now using MacPorts (got desperate)
  Paperclip.options[:command_path] = '/opt/local/bin' 
  
  # Turn on additional logging
  Paperclip.options[:swallow_stderr] = false
  
end

