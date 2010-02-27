require 'rack/utils'

# We use this, as flash can't submit files with the session cookie.
# Without this, all the flash requests will be redirected to the login page. 
# 
# This could be considered a security risk as we're putting the session_key in the query string. 
# Not 100% sure if that's any worse than the having it in the header. (it's just easier to forge)

class FlashSessionCookieMiddleware
  
  def initialize(app, session_key)
    @app = app
    @session_key = session_key ||= '_nerd_session'
  end
  
  def call(env)

    if env['HTTP_USER_AGENT'] =~ /^(Adobe|Shockwave) Flash/
      
      params = ::Rack::Utils.parse_query(env['QUERY_STRING'])

      unless params[@session_key].nil?
        env['HTTP_COOKIE'] = "#{@session_key}=#{params[@session_key]}".freeze
      end
    end
    
    @app.call(env)
    
  end
end