require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AdminController do
  
  
  describe "route recognition" do
      
    ['cheese','bacon','ham','cheese'].each do |i|
  
      it "should return an admin 404 for /admin/#{i}" do
        params_from(:get, "/admin/#{i}").should == { :controller => "admin", 
                                                     :action => "not_found",
                                                     :url => [i] }
      end
    end
  end
end
