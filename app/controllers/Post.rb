class Post 
	attr_accessor :id, :title, :description, :latitdude, :longitude
	def initialize(id, title, description, latitdude, longitude)
		@id = id
		@title = title
		@description = description
		@latitdude = latitdude
		@longitude = longitude
	end
	def to_s 
		return "id: "+@id.to_s + " title: " + @title.to_s + " description: " + @description.to_s + " latitdude: " + 
		@latitdude.to_s + " longitude: " + @longitude.to_s
	end
end