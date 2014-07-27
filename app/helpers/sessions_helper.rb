module SessionsHelper

	def sign_in(user)
		# create a new token
		remember_token = User.new_remember_token

		# place raw token in browser cookies
		cookies.permanent[:remember_token] = remember_token

		# save the hashed token into the database
		user.update_attribute(:remember_token, User.digest(remember_token))

		# set current user equal to the given user
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token) 
	end

	def current_user?(user)
		user == current_user
	end

	def signed_in_user
      	unless signed_in?
        	store_location
        	flash[:warning] = "Please sign in."   
        	redirect_to signin_url
      	end

      	# redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

	def sign_out
		# change user's remember token in the database
		current_user.update_attribute(:remember_token, User.digest(User.new_remember_token))

		# remove remember token from the session
		cookies.delete(:remember_token)

		# set current user to nil
		self.current_user =  nil
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		# This method puts the requested URL in the session variable 
		# under the key :return_to, but only for a GET request (if request.get?)
		session[:return_to] = request.url if request.get?
	end
end
