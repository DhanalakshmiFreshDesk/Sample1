require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
	puts config
  config.include Capybara::DSL, :type => :request
end


RSpec.describe "StaticPages", :type => :request do
	describe "Home Page" do
  	it "should have right title" do
  		visit '/static_pages/home'
  		page.should has_selector?('title', :text => "Ruby on Rails Tutorial Sample App | Home")
  	end
	end
	describe "Help Page" do
		it "should have right title" do
  		visit '/static_pages/home'
  		page.should has_selector?('title', :text => "Ruby on Rails Tutorial Sample App | Help")
  	end
	end
	describe "For About Page" do
		it "should have right title" do
  		visit '/static_pages/home'
  		page.should has_selector?('title', :text => "Ruby on Rails Tutorial Sample App | About Page")
  	end
  end
end
