class LogoutController < ApplicationController

	def index
		if !session[:user_id].nil?
			user = User.find(session[:user_id])
			if !user.token.nil?
				user.token = nil
				user.save!
			end
		end
		reset_session
		cookies.delete(:login)
		cookies.delete(:session_id)
		cookies.delete(:user_id)
		redirect_to "/"
	end
	
private
	def public_action?
		true
	end
	
	def admin_action?
		false
	end
	
	def verify_private_action(user_id)
		false
	end
end
