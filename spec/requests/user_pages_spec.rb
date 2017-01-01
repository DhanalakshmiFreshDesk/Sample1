require 'rails_helper'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
	puts config
  config.include Capybara::DSL, :type => :request
end

RSpec.describe "UserPages", :type => :request do
	subject{ page }
  describe "signup" do
  	before { visit signup_path }
    
    it{ should has_selector?('title', text: "Sign up" ) }
    it{ should has_selector?('title', text: full_title('Sign up'))}
  end
  describe 'User pages' do
		subject { page }
		describe "signup" do
			before { visit signup_path }
			let(:submit) { "Create my account" }
			describe "with invalid information" do
				it "should not create a user" do
					expect { click_button submit }.not_to change(User, :count) 
				end
			end
		end
	end

	describe "with valid information" do 
		before { click_button submit}
		let(:user) { User.find_by_email_id('user@example.com')}
		before do
			fill_in "Name", with: "Example User"
			fill_in "Email", with: "user@example.com"
			fill_in "Password", with: "foobar"
			fill_in "Confirmation", with: "foobar"
		end

		it { should have_selector('title', text: 'Sign up')}
		it { should have_selector('div.alert.alert-success', text: 'Welcome')}
		it { should have_content('error')}
		it "should create a user" do
			expect { click_button submit }.to change(User, :count).by(1)
		end 
	end
	describe "after saving the user" do
		it { should have_link('Sign out')}
	end
end
