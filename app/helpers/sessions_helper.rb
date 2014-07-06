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

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.digest(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token) 
	end
end
