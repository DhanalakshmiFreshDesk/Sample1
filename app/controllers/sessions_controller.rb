class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email_id(params[:session][:email_id])
		if user && user.authentication(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = "Invalid email/password combination"
			render 'new'
		end
	end
	
	def destroy
		sign_out
		redirect_to root_path
	end
end
