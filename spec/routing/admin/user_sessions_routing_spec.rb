require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe Admin::UserSessionsController do
  describe "route generation" do


    it "maps #new" do
      route_for(:controller => "admin/user_sessions", :action => "new").should == "/login"
    end

    it "maps #create" do
      route_for(:controller => "admin/user_sessions", 
                :action => "create").should == {:path => "/admin/user_sessions", :method => :post}
    end

    it "maps #destroy" do
      route_for(:controller => "admin/user_sessions", 
                :action => "destroy").should == {:path =>"/logout", :method => :delete}
    end
    
    
    it "maps #dashboard" do
      route_for(:controller => "admin/user_sessions", 
                :action => "dashboard").should == {:path =>"/admin", :method => :get}
    end
    
  end

  describe "route recognition" do
    
    it "generates params for #new" do
      params_from(:get, "/login").should == { :controller => "admin/user_sessions", 
                                              :action => "new" }
    end

    it "generates params for #create" do
      params_from(:post, "/admin/user_sessions").should == { :controller => "admin/user_sessions", 
                                                             :action => "create" }
    end

    it "generates params for #destroy" do
      params_from(:delete, "/logout").should == { :controller => "admin/user_sessions", 
                                                  :action => "destroy" }
    end

    it "generates params for #dashboard" do
      params_from(:get, "/admin").should == { :controller => "admin/user_sessions", 
                                                  :action => "dashboard" }
    end

    
  end
end
