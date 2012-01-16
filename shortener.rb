require 'sinatra'
require_relative 'config'

class Shortener < Sinatra::Base

  helpers do
    include LINKSTORE
  end

  get '/hi' do
    'Hello world'
  end

  get %r{^/([0-9a-zA-Z]+)$} do
    postid = params[:captures][0]
    redirect link(postid), 301
  end

  post '/shorten' do
    shorten params[:key], params[:link]
  end
end

def app
  Shortener
end