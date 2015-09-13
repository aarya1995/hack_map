require  'firebase'
require_relative  'Post'
class PostsHandler

	MIN_DESCRIPTION_LENGTH = 1
	private_constant :MIN_DESCRIPTION_LENGTH

	MIN_TITLE_LENGTH = 3
	private_constant :MIN_TITLE_LENGTH
	LIST_OF_POSTS_KEY = "Posts"
	private_constant :LIST_OF_POSTS_KEY
	def self.secret
  		10
	end
	def initialize(base_uri)
		@firebase = Firebase::Client.new(base_uri)
	end
	def create_post(title, description, latitude, longitude)
		if(not(is_valid(title,description,latitude,longitude)))			
			raise ValueError("Invalid Parameters")

		else

			response = @firebase.push("Posts",{:title => title, :description => description, :Location =>{:latitude => latitude ,
				:longitude => longitude}} )
			
			return response.success?
		end
	end

	def get_all_posts()
		response = @firebase.get(LIST_OF_POSTS_KEY)
		listOfPosts = parse_json_for_posts(response.body)
		return listOfPosts
	end

	private
	def is_valid(title,description,latitude,longitude)
		if(title == nil or description == nil or latitude == nil or longitude == nil)
			return false
		end
		if(description.length < MIN_DESCRIPTION_LENGTH)

			return false
		end
		if(title.length < MIN_TITLE_LENGTH)
			return false
		end

		return true
	end

	def parse_json_for_posts(jsonOfPosts)
		if jsonOfPosts.nil?
			return []
		else
			id_key= 0
			location_key = "Location"
			longitude_key = "longitude"
			latitude_key = "latitude"
			description_key = "description"
			title_key = "title"
			listOfPosts = []

			jsonOfPosts.each{
				|postJson|

				dictionaryOfPost = postJson[1]
				post = Post.new(postJson[id_key], dictionaryOfPost[title_key],  dictionaryOfPost[description_key], 
					dictionaryOfPost[location_key][latitude_key], dictionaryOfPost[location_key][longitude_key])
				listOfPosts.append(post)

			}
			return listOfPosts
		end
	end

end
