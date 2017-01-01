module UsersHelper
	def gravatar_for(user)
		#gravatar_id = Digest::MD5::hexdigest(user.email_id.downcase)
		#gravatar_url = "https://secure.gravatar.com/avatars/#{gravatar_id}.png" 
		#image_tag(gravatar_url, alt: "none", class: "gravatar")
	end
end
