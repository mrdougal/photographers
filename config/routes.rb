ActionController::Routing::Routes.draw do |map|



  # This is the public part of the website
  map.with_options :controller => 'site' do |site|
    
    # This is so passenger dones't sleep while we browse cached areas of the site
    site.keep_alive '/stylesheets/caffine.css', :action => 'caffine', :format => 'css'

    # site.categories 'categories', :action => "categories"
    # site.category 'categories/:permalink', :action => "category"
    
    # site.sets 'sets', :action => "sets" 
    # site.set 'sets/:permalink', :action => "set"   


    site.photos 'photos', :action => "photos"
    site.tagged_photos 'photos/tagged/:tag', :action => "tagged_photos" 
    site.photo 'photos/:permalink', :action => "photo"  

    # This is for defining a sitemap, used for SEO
    site.sitemap 'sitemap', :action => 'map'
    site.formatted_sitemap 'sitemap.:format', :action => 'map'
  
    site.about_us 'about', :action => "about" 

    # Define the homepage
    site.root :action => 'homepage'
    
    # Rescues, called from Apache config
    site.connect 'rescue/404', :action => "not_found" 
    site.connect 'rescue/403', :action => "not_allowed" 
    
  end


  # login/logout
  map.with_options :controller => 'admin/user_sessions' do |session|
    session.login 'login', :action => 'new'
    session.logout 'logout', :action => 'destroy'
    
    # A summary page for when the user first arrives in the admin section
    session.admin 'admin', :action => 'dashboard'

  end
  
  
  # For the admin section of the website
  map.namespace :admin do |admin|

    admin.resources :users
    admin.resource :user_sessions, :except => [:new, :destroy]
    # admin.resources :categories, :collection => {:sort => :post}
    admin.resources :photos
    # admin.resources :sets, :collection => {:sort => :post}

  end

  # Admin 404
  map.connect 'admin/*url', :controller => "admin", :action => 'not_found'

  # Catch all, mainly for categories
  # map.connect '*url', :controller => 'site', :action => 'show'



end
