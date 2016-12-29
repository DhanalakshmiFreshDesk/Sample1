require 'rails_helper'

RSpec.describe "UserPages", :type => :request do
	subject{ page }
  describe "GET /user_pages" do
  	before { visit signup_path }
    
    it{ should has_selector?('title', text: "Sign up" ) }
    it{ should has_selector?('title', text: full_title('Sign up'))}
  end
end
