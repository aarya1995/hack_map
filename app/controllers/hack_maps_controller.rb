require 'PostsHandler'

class HackMapsController < ApplicationController
	@posts= []
	def index
		
		posthandler = PostsHandler::PostsHandler.new("https://glaring-torch-4803.firebaseio.com")
		@posts = posthandler.get_all_posts()
		puts @posts
		
	end

	def create
		
		latitude = params[:latitude] 
		longitude = params[:longitude]
		title = params[:title]
		description = params[:description]
		tag = params[:tag]
		 posthandler = PostsHandler::PostsHandler.new("https://glaring-torch-4803.firebaseio.com")
		# isSuccessful = posthandler.create_post("test","hellofdafafasd",1234,144)
		# if(isSuccessful)

		# else

		# end
		posthandler.create_post(title,description,latitude,longitude,tag)
		
		redirect_to hack_maps_path
	end

end
