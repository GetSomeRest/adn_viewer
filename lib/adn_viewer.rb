require 'uri'
require 'net/http'
require 'curb-fu'
require 'json'

class Adn_Viewer

	def self.token(key, secret)
		JSON.parse(CurbFu.post({:host => 'developer.api.autodesk.com', :path => '/authentication/v1/authenticate', :protocol => "https"}, { :client_id => key, :client_secret => secret, :grant_type => 'client_credentials' }).body)
	end

	def self.create_bucket(token, name, policy)
		url = URI("https://developer.api.autodesk.com/oss/v1/buckets")
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(url)
		request["content-type"] = 'application/json'
		request["authorization"] = 'Bearer ' + token
		request.body = "{\"bucketKey\":\"" + name + "\",\"policy\":\"" + policy + "\"}"
		JSON.parse(http.request(request).read_body)
	end

	def self.check_bucket(token, name)
		JSON.parse(CurbFu.get({:host => 'developer.api.autodesk.com', :path => '/oss/v1/buckets/' + name + '/details', :protocol => "https", :headers => { "Authorization" => "Bearer " + token, "Content-Type" => "application/json" }}).body)
	end

	def self.supported_formats(token)
		JSON.parse(CurbFu.get({:host => 'developer.api.autodesk.com', :path => '/viewingservice/v1/supported', :protocol => "https", :headers => { "Authorization" => "Bearer " + token, "Content-Type" => "application/json" }}).body)
	end

	def self.upload_file(token, name, filename, filepath)
		boundary = "AaB03xZZZZZZ11322321111XSDW"
		uri = URI("https://developer.api.autodesk.com/oss/v1/buckets/" + name + "/objects/" + filename)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true
		request = Net::HTTP::Put.new(uri)
		request.body_stream=File.open(filepath)
		request["content-type"] = 'application/octet-stream'
		request["Content-Length"] = File.size(filepath)
		request["authorization"] = 'Bearer ' + token
		request.add_field('session', boundary)
		JSON.parse(http.request(request).read_body)
	end

	def self.register(token, urn)
		url = URI("https://developer.api.autodesk.com/viewingservice/v1/register")
		http = Net::HTTP.new(url.host, url.port)
		http.use_ssl = true
		request = Net::HTTP::Post.new(url)
		request["authorization"] = 'Bearer ' + token
		request["content-type"] = 'application/json'
		request.body = "{\n    \"urn\": \"" + urn + "\"\n}"
		JSON.parse(http.request(request).read_body)
	end

end