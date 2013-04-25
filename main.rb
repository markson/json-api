require 'sinatra/base'
require 'dm-core'
require 'dm-migrations'
require 'dm-serializer/to_json'
require 'json'
require 'haml'
require 'pry'
DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://Lin@localhost/maklog')

class Posts
	include DataMapper::Resource
	property :id, Serial
	property :title, String
	property :author, String
	property :intro, Text
	property :publishedAt, Date
	property :description, Text
end
DataMapper.finalize
#DataMapper.auto_migrate!
class MyApp < Sinatra::Base
	set :public_folder, File.dirname(__FILE__) + '/static'

	before do
		content_type 'application/json'
	end
	get '/test' do
		binding.pry
	end

	get '/posts' do
		hash = {posts:Posts.all}
		hash.to_json
	end

	put '/posts/:id' do
		post = Posts.get(params[:id].to_i) 
		data = JSON.parse(request.body.read)
		result = post.update(
			:title => data['post']['title'],
			:intro => data['post']['intro'],
			:description => data['post']['description']
		)
		'good'
		if result 
			['200', {'Content-Type' => 'application/json'}, [{result:true}.to_json]]
		# else
		# 	binding.pry
		# 	['500', {'Content-Type' => 'application/json'}, [{result:false}.to_json]] 
		end

	end

end
