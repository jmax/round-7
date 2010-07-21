require 'spec_helper'

describe PersonasController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/personas" }.should route_to(:controller => "personas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/personas/new" }.should route_to(:controller => "personas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/personas/1" }.should route_to(:controller => "personas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/personas/1/edit" }.should route_to(:controller => "personas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/personas" }.should route_to(:controller => "personas", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/personas/1" }.should route_to(:controller => "personas", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/personas/1" }.should route_to(:controller => "personas", :action => "destroy", :id => "1") 
    end
  end
end
