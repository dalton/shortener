require "rspec"
require "rack/test"
ENV["RACK_ENV"] = 'test'
require_relative "../shortener"



describe "My URL Shortener" do
	include Rack::Test::Methods
	def app
		Shortener
	end
	it "redirects to an example site" do
		get "/123"
		last_response.status.should == 301
		last_response.headers["location"].should == "http://www.espn.com"
  end

  it "stores a site to a shorter key for sharing" do
    post "/shorten", {key: 'short', link: 'http://www.ruby-lang.org'}
    get "/short"
		last_response.status.should == 301
		last_response.headers["location"].should == "http://www.ruby-lang.org"

  end
end

