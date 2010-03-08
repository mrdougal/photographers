ActionController::Routing::Routes.draw do |map|
  map.resources :photo_sets





  # This is the public part of the website
  map.with_options :controller => 'site' do |site|
    
    # This is so passenger dones't sleep while we browse cached areas of the site
    site.keep_alive '/stylesheets/caffine.css', :action => 'caffine', :format => 'css'

    # General pages
    site.about_us 'about', :action => "about" 
    site.contact 'contact', :action => "contact" 

    # Rescues, called from Apache config
    site.connect 'rescue/404', :action => "not_found" 
    site.connect 'rescue/403', :action => "not_allowed" 
  
    # # This is for defining a sitemap, used for SEO
    # site.sitemap 'sitemap', :action => 'map'
    # site.formatted_sitemap 'sitemap.:format', :action => 'map'
    
    # Define the homepage
    site.root :action => 'homepage'
    
  end
  
  map.with_options :controller => "photos" do |photo|

    # Pagination routes needs to be defined before their non-paginated siblings. 
    # (as Rails matches routes in order top to bottom)
    
    photo.photos_with_pages 'photos/page/:page', :action => "index" 
    photo.photos 'photos', :action => "index"

    # Tags
    photo.photos_tagged_with_pages 'photos/tagged/:tag/page/:page', :action => "tagged" 
    photo.photos_tagged 'photos/tagged/:tag', :action => "tagged" 
    photo.photos_tags 'photos/tagged', :action => "tags" 

    # Sets
    photo.photo_set 'photos/sets/:permalink', :action => "set" 
    photo.photo_sets_with_pages 'photos/sets/page/:page', :action => "sets" 
    photo.photo_sets 'photos/sets', :action => "sets" 
    
    photo.photo 'photos/:permalink', :action => "show"
    
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
    admin.resources :users
    admin.resources :photos, :except => [:show, :index, :new] 
    admin.resources :categories do |categories|
      categories.resources :photo_sets, :as => "sets"
    end

  end


end
