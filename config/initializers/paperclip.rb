
# ImageMagick on my local box, has been installed via Homebrew
# Therefore is installed into /usr/local (which is already in our path)

if ['development','test'].member? Rails.env
  
  # Turn on additional logging
  Paperclip.options[:swallow_stderr] = false
  
end

