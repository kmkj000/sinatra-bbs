require 'bundler'
Bundler.require
require './models/bbs.rb'

module MyBbs
  class Application < Sinatra::Base

    configure :development do
      register Sinatra::Reloader
    end

    before do
      @author = "putimaru"
    end

    helpers do
      def strong(text)
        %|<strong>#{text}</strong>|
      end
    end

    # routing
    get "/" do
    	# dbからid降順で全て取得
    	@posts = Post.order("id desc").all
      slim :index
    end

    post "/new" do
      # 投稿を作成
      Post.create({
        :body => params[:body]
      })
      redirect '/'
    end

    post'/delete' do
      Post.find(params[:id]).destroy
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

  end
end
