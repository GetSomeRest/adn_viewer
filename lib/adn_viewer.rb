class Adn_Viewer

	def self.token(key, secret)
		JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => key, :client_secret => secret, :grant_type => 'client_credentials' }).body)
	end

	def self.create_bucket(token, name, policy)
		puts JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/oss/v1/buckets', :protocol => "https", :headers => { "Authorization" => "Bearer " + token, "Content-Type" => "application/json" }}, { :bucketKey => name, :policy => policy }).body)
	end

	def self.check_bucket(token, name)
		JSON.parse(CurbFu.get({:host => 'developer.api.autodesk.com', :path => '/oss/v1/buckets/' + name + '/details', :protocol => "https", :headers => { "Authorization" => "Bearer " + token, "Content-Type" => "application/json" }}).body)
	end

end