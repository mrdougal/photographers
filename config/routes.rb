ActionController::Routing::Routes.draw do |map|




  # This is the public part of the website
  map.with_options :controller => 'site' do |site|
    
    # This is so passenger dones't sleep while we browse cached areas of the site
    site.keep_alive '/stylesheets/caffine.css', :action => 'caffine', :format => 'css'


    site.photos 'photos', :action => "photos"
    site.photo 'photos/:permalink', :action => "photo"  
    site.tagged_photos 'photos/tagged/:tag', :action => "tagged_photos" 

    site.about_us 'about', :action => "about" 

    # Rescues, called from Apache config
    site.connect 'rescue/404', :action => "not_found" 
    site.connect 'rescue/403', :action => "not_allowed" 
  
    # # This is for defining a sitemap, used for SEO
    # site.sitemap 'sitemap', :action => 'map'
    # site.formatted_sitemap 'sitemap.:format', :action => 'map'
    
    # Define the homepage
    site.root :action => 'homepage'
    
  end
  
  
  
  # LOGIN/LOGOUT
  map.with_options :controller => 'admin/user_sessions' do |session|
    session.login 'login', :action => 'new'
    session.logout 'logout', :action => 'destroy'
    
    # A summary page for when the user first arrives in the admin section
    session.admin 'admin', :action => 'dashboard'

  end
  
  # ADMIN section of the website
  map.namespace :admin do |admin|

    admin.resource :user_sessions, :except => [:new, :destroy]
    admin.resources :photos

  end


end
