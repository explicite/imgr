class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def from_facebook
		auth_hash = request.env["omniauth.auth"]

		
  		authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
		  if authorization
		    user = User.find_by_email(auth_hash["info"]["email"])
		  else
		  	password = SecureRandom.hex(16)
		    user = User.new(name: auth_hash["info"]["name"], email: auth_hash["info"]["email"], password: password, password_confirmation:  password)
		    user.save
		    auth = Authorization.new(provider: auth_hash["provider"], uid: auth_hash["uid"], user_id: user.id)
		    auth.save
		  end
		  
		sign_in user
		redirect_to user
		
		
		
	end

	def destroy	
		sign_out
		redirect_to root_path
	end
end
