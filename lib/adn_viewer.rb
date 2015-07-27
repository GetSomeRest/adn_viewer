class Adn_Viewer
	def self.token(key, secret)
		token = JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => key, :client_secret => secret, :grant_type => 'client_credentials' }).body)
		token["access_token"]
	end
end