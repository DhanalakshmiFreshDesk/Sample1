require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
	puts config
  config.include Capybara::DSL, :type => :request
end

RSpec.describe "StaticPages", :type => :request do
  describe "Static Pages" do
    subject{ page}
    let(:base_title) { "Ruby on Rails Tutorial Sample App" }
    describe "Home Page" do
      before { visit root_path }
      it { 
        page.should has_selector?('title', :text => full_title(''))
      }
      it "should not have a custom page title" do
        page.should_not have_selector('title', :text => full_title('Home'))
      end
    end
    describe "Help Page" do
		  it "should have right title" do
  		  visit help_path
  		  page.should has_selector?('title', :text => full_title('Help'))
      end
    end
  	describe "For About Page" do
  		it "should have right title" do
    		visit about_path
    		page.should has_selector?('title', :text => full_title('About Page'))
    	end
    end
    describe "Contact page" do
      before { visit contact_path }
      it {
        page.should has_selector?('header', text: "Contact")
      }
      it "should have the title 'Contact'" do 
        page.should has_selector?('title', :text => full_title('Contact'))
      end 
    end
  end
end

