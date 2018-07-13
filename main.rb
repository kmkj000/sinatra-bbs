require "sinatra"
require 'sinatra/reloader'
require 'slim'
require 'active_record'
require 'json'
require './models/bbs.rb'

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

post "/new" do
  # 投稿を作成
  Comment.create({
    :body => params[:body]
  })
  redirect '/'
end

post'/delete' do
  Comment.find(params[:id]).destroy
end

get "/about" do
	@title = "about"
  @content = "about contnt"
  @email = 'mail@k.com'
  slim :about
end

after do
  ActiveRecord::Base.connection.close
end
