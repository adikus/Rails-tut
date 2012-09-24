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

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end
end