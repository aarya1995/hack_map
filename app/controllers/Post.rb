class Post 
	attr_accessor :id, :title, :description, :latitude, :longitude
	def initialize(id, title, description, latitude, longitude)
		@id = id
		@title = title
		@description = description
		@latitude = latitude
		@longitude = longitude
	end
	def to_s 
		return "id: "+@id.to_s + " title: " + @title.to_s + " description: " + @description.to_s + " latitude: " + 
		@latitude.to_s + " longitude: " + @longitude.to_s
	end
end
