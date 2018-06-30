require "sinatra"
require 'sinatra/reloader'
require 'slim'
require 'active_record'
#require './models/comments.rb'

ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "./db/bbs.db"
)

class Comment < ActiveRecord::Base
end

before do
  @author = "putimaru"
end

helpers do
  def strong(text)
    %|<strong>#{text}</strong>|
  end
end

get "/" do
	# dbからid降順で全て取得
	@comments = Comment.order("id desc").all
  slim :index
end

get "/about" do 
	@title = "about"
  @content = "about contnt"
  @email = 'mail@k.com'
  slim :about
end
