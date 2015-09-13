require 'PostsHandler'
class CommentsController < ApplicationController
	def create
		respond_to do |format|
			format.html{}
			format.json{}
		end
		@id = params[:comment][:postId]
		@comment = params[:comment][:description]
		

		

		posthandler = PostsHandler::PostsHandler.new("https://glaring-torch-4803.firebaseio.com")
		posthandler.comment(@id,@comment)
	end
end
