require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
	puts config
  config.include Capybara::DSL, :type => :request
end

RSpec.describe "AuthenticationPages", :type => :request do
  describe "GET /authentication_pages" do
    subject { page }
		describe "signin" do 
			before { visit signin_path }
			describe "with valid information" do 
				let(:user) { FactoryGirl.create(:user) } 
				before do
					fill_in "Email", with: user.email_id 
					fill_in "Password", with: user.password 
					click_button "Sign in"
				end
				it { should has_selector?('h1', text: 'Sign in') } 
	   		it { should has_selector?('title', text: 'Sign in') }
	   		it { should has_selector?('div.alert.alert-error', text: "Invalid")}
	   		it { should have_link('Profile', href: user_path(user)) } 
	   		it { should have_link('Sign out', href: signout_path) } 
	   		it { should_not have_link('Sign in', href: signin_path) }
	   		describe "followed by signout" do
					before { click_link "Sign out" }
					it { should have_link('Sign in') } 
				end
	   	end

	   	describe "after visiting another page" do
				before { click_link "Home" }
				it { should_not has_selector?('div.alert.alert-error') }
			end
		end
  end
end
