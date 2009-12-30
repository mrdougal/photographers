require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SiteController do
  
  
  describe "route generation" do
    
    it "maps homepage" do
      route_for(:controller => "site", 
                :action => "homepage").should == "/"
    end
    
    it "maps about" do
      route_for(:controller => "site", :action => "about" ).should == "/about"
    end
    

    it "maps categories" do
      route_for(:controller => "site",
                :action => "categories" ).should == '/categories'
    end 

    it "maps category" do
      route_for(:controller => "site",
                :action => "category",
                :permalink => "cheese").should == '/categories/cheese'
    end 

    it "maps sets" do
      route_for(:controller => "site",
                :action => "sets").should == '/sets'
    end
    
    it "maps set" do
      route_for(:controller => "site",
                :action => "set",
                :permalink => "cheese" ).should == '/sets/cheese'
    end

    it "maps photos" do
      route_for(:controller => "site",
                :action => "photos").should == '/photos'
    end

    
    it "maps photo ham-bacon-cheese" do
      route_for(:controller => "site",
                :action => "photo",
                :permalink => "ham-bacon-cheese" ).should == '/photos/ham-bacon-cheese'
    end
    
    describe "error docs, called by Apache" do
        
      it "should map to 404 error" do
        route_for(:controller => "site",
                  :action => "not_found" ).should == '/rescue/404'
      end
      
      it "should map to 403 error" do
        route_for(:controller => "site",
                  :action => "not_allowed" ).should == '/rescue/403'
        
      end
    end
  end
  

  describe "route recognition" do
  
      it "generates params for homepage" do
        params_from(:get, "/").should == { :controller => "site", 
                                           :action => "homepage" }
      end
      
      it "generate params for about" do
        params_from(:get, "/about").should == { :controller => "site",
                                                :action => "about" }
      end
      
      it "generates params for categories" do
        params_from(:get, "/categories").should == { :controller => "site", 
                                                     :action => "categories" }
      end

      it "generates params for category 'cheese'" do
        params_from(:get, "/categories/cheese").should == { :controller => "site", 
                                                            :action => "category",
                                                            :permalink => "cheese"}
      end

      it "generates params for set 'bacon'" do
        params_from(:get, "/sets/cheese-bacon").should == { :controller => "site", 
                                                            :action => "set",
                                                            :permalink => "cheese-bacon"}
      end
      
      it "generate params for sitemap" do
        params_from(:get, "/sitemap").should == { 
          :controller => "site",
          :action => "map"  
        }
      end
      
      describe "errors docs called by Apache" do  
                       
        [:get, :post, :put, :delete].each do |m|
          it "generate params for #{m} /rescue/404" do
            params_from(m, '/rescue/404').should == {
              :controller => "site", 
              :action => "not_found"
            }
          end
        end

        [:get, :post, :put, :delete].each do |m|
          it "generate params for #{m} /rescue/403" do
            params_from(m, '/rescue/403').should == {
              :controller => "site", 
              :action => "not_allowed"
            }
          end
        end

        
      end


    
    describe "category pages" do
      
      it "generates params for /chairs" do
        params_from(:get, "/chairs").should == { :controller => "site", 
                                                  :action => "show",
                                                  :url => ['chairs'] }
      end

      it "generates params for /chairs/office" do
        params_from(:get, "/chairs/office").should == { :controller => "site", 
                                                        :action => "show",
                                                        :url => ['chairs','office'] }
      end
    end

  end
end
