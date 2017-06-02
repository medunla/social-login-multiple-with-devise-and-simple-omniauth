class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	private
	def current_visitor
		@current_visitor ||= Visitor.find( session[:login_id] ) if session[:login_id] && session[:login_type] == 'visitor'
	end
	helper_method :current_visitor
end
