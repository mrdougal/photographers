require 'spec_helper'

describe Admin::AccountsController do

  describe "routing" do

    it "recognizes and generates #show" do
      { :get => "/admin/account" }.should route_to(:controller => "admin/accounts", :action => "show")
    end

    it "recognizes and generates #edit" do
      { :get => "/admin/account/edit" }.should route_to(:controller => "admin/accounts", :action => "edit")
    end

    it "recognizes and generates #update" do
      { :put => "/admin/account" }.should route_to(:controller => "admin/accounts", :action => "update") 
    end

    describe "disabled actions" do
      
      it "shouldn't recognise #new" do
        { :get => "/admin/account/new" }.should route_to(:controller => "admin", 
                                                          :action => "not_found", 
                                                          :url => ["account","new"])
      end

      it "shouldn't recognise #create" do
        { :post => "/admin/account" }.should route_to(:controller => "admin", 
                                                        :action => "not_found", 
                                                        :url => ['account'])
      end

      it "shouldn't recognise #destroy" do
        { :delete => "/admin/account" }.should route_to(:controller => "admin", 
                                                        :action => "not_found", 
                                                        :url => ['account']) 
      end
    end
  end
end
