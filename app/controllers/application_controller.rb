class ApplicationController < ActionController::Base
	include Pundit
  protect_from_forgery with: :exception
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	private
	def user_not_authorized
		redirect_to(new_user_session_path)
	end
end
