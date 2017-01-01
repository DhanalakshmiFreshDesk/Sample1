FactoryGirl.define do 
	factory :user do
		user_name "Michael Hartl" 
		email_id "michael@example.com" 
		password "foobar"
		password_confirmation "foobar"
	end 
end