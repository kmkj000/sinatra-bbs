require "sinatra"
require 'sinatra/reloader'
require 'slim'
require 'active_record'
require './models/comments.rb'

before do
  @author = "putimaru"
end

helpers do
  def strong(text)
    %|<strong>#{text}</strong>|
  end
end

get "/" do 
  @title = "main"
  @content = "main contnt" 
  slim :index
end

get "/about" do 
	@title = "about"
  @content = "about contnt"
  @email = 'mail@k.com'
  slim :about
end
