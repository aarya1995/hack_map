require 'PostsHandler'

class HackMapsController < ApplicationController
	@posts= []
	def main
		
		posthandler = PostsHandler::PostsHandler.new("https://glaring-torch-4803.firebaseio.com")
		@posts = posthandler.get_all_posts()
		puts @posts
		
	end

	def index 

	end

	def create
		
		latitude = params[:latitude] 
		longitude = params[:longitude]
		title = params[:title]
		description = params[:description]
		
		 posthandler = PostsHandler::PostsHandler.new("https://glaring-torch-4803.firebaseio.com")
		# isSuccessful = posthandler.create_post("test","hellofdafafasd",1234,144)
		# if(isSuccessful)

		# else

		# end
		posthandler.create_post(title,description,latitude,longitude)
		
		redirect_to '/hack_maps/main'
	end

end
