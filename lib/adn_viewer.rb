class Adn_Viewer
	
	def self.token(key, secret)
		JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => key, :client_secret => secret, :grant_type => 'client_credentials' }).body)
	end

	def self.create_bucket(token, name, policy)
		puts "trying"
		JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/oss/v1/buckets', :protocol => "https", :header => { "Authorization" => ("Bearer " + token) }}, { :bucketKey => name, :policy => policy }).body)
	end

end