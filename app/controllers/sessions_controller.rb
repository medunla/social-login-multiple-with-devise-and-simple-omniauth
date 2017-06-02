class SessionsController < ApplicationController
	def create
		puts "SessionsController::create"
		params = request.env["omniauth.params"]
		type = params["type"]

		auth = request.env["omniauth.auth"]
		session[:omniauth] = auth

		if type == "user"
			puts "SessionsController::user"
			@user = User.from_omniauth( auth )
			if @user.persisted?
				puts "SessionsController::@user.persisted? == true"
				sign_in_and_redirect @user, :event => :authentication
			else
				puts "SessionsController::@user.persisted? == false"
				session["devise.facebook_data"] = auth
				redirect_to new_user_registration_url
			end
		elsif type == "visitor"
			puts "SessionsController::visitor"
			login = Visitor.sign_in_from_omniauth(auth)
			session[:login_id] = login.id
			session[:login_type] = 'visitor'
			redirect_to root_path
		end
	end

	def destroy
		puts "SessionsController::destroy"
		session[:omniauth] = nil
		session[:login_id] = nil
		session[:login_type] = nil
		redirect_to root_path
	end
end
