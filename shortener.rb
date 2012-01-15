require 'sinatra'

get %r{^/([0-9a-zA-Z]+)$} do
  postid = params[:captures][0].to_i(36)
  redirect "http://blogs.sitepoint.com/?p=#{postid}", 301  
end


get "/*" do |path|
  redirect "http://blogs.sitepoint.com/#{path}", 301
end
