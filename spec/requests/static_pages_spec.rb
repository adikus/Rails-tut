require 'spec_helper'

describe "Static pages" do

subject { page }

  describe "Home page" do
  	before { visit root_path } 
    
    it "should have the h1 'Sample App'" do
      should have_selector('h1', text: 'Sample App')
    end

    it "should have the base title" do
      should have_selector('title', text: full_title)
    end

    it "should not have a custom page title" do
      should_not have_selector('title', text: '| Home')
    end
  end

  describe "Home page" do
  	before { visit help_path } 
    
    it "should have the h1 'Sample App'" do
      should have_selector('h1', text: 'Sample App')
    end

    it "should have the base title" do
      should have_selector('title', text: full_title("Help"))
    end
  end
end