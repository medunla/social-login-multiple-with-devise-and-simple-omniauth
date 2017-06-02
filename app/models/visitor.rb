class Visitor < ApplicationRecord
	def self.sign_in_from_omniauth(auth)
		puts "Visitor::sign_in_from_omniauth"
		find_by( provider: auth["provider"], uid: auth["uid"] ) || create_visitor_from_omniauth(auth)
	end

	def self.create_visitor_from_omniauth(auth)
		puts "Visitor::create_visitor_from_omniauth"
		create(
			provider: auth["provider"],
			uid: auth["uid"],
			name: auth["info"]["name"],
			image: auth["info"]["image"],
			email: auth["info"]["email"]
		)
	end
end
