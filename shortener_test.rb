require_relative "shortener"
require "rspec"
require "rack/test"
set :environment, :test
describe "My URL Shortener" do
	include Rack::Test::Methods
	def app
		Sinatra::Application
	end
	it "redirects to a blog post" do
		get "/123" # 123 (base 36) == 1371 (base 10)
		last_response.status.should == 301
		last_response.headers["location"].should == "http://blogs.sitepoint.com/?p=1371"
	end
	it "redirect to blog post with lowercase digits" do
		get "/a" # a (base 36) == 10 (base 10)
		last_response.status.should == 301
		last_response.headers["location"].should == "http://blogs.sitepoint.com/?p=10"
	end
	it "redirect to blog post with uppercase digits" do
		get "/A" # A (base 36) == 10 (base 10)
		last_response.status.should == 301
		last_response.headers["location"].should == "http://blogs.sitepoint.com/?p=10"
	end
	it "redirects to home" do
		get "/"
		last_response.status.should == 301
		last_response.headers["location"].should == "http://blogs.sitepoint.com/"
	end
	it "unrecognised path redirects" do
		get "/foo/bar"
		last_response.status.should == 301
		last_response.headers["location"].should == "http://blogs.sitepoint.com/foo/bar"
	end
end

