require 'sinatra/base'
require 'json'
require 'haml'
require 'pry'

class MyApp < Sinatra::Base
	set :public_folder, File.dirname(__FILE__) + '/static'

	before do
		content_type 'application/json'
	end

	get '/posts' do
		hash = {
			posts: [
				{
					id:1,
					author:'Lin',
					intro:"Today really a *good day*, because you are around",
					publishedAt: Date.new(1985,4,14),
					description:<<-EOF 
It should be **the day** before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
EOF
				},
				{
					id:2,
					author:'Sheepsheep',
					intro:"Today I'm not happy, because you are not near",
					publishedAt: Date.new(1984,10,1),
					description:<<-EOF
It should be the day before, I was still jerking off in my car, in the middle noon Thursday. There is a old lady who trying to park her car in the block next to me, when I was about to move my luggage in the front row. I thought she is too old to notice the unusual activity was going on, but unfortunitily she does. so they maybe report a suspected car was parking outside the community parking lot and propbly sleeping there for the night.
				  	EOF
				}	


			]	
		}
		hash.to_json
	end
end
