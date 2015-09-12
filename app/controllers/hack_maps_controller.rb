require 'PostsHandler'

class HackMapsController < ApplicationController
	def main
		 posthandler = PostsHandler::PostsHandler.new("https://glaring-torch-4803.firebaseio.com")
		# isSuccessful = posthandler.create_post("test","hellofdafafasd",1234,144)
		# if(isSuccessful)

		# else

		# end
		posthandler.get_posts(132,1231,123)
		
	end

	def create

	end
end
