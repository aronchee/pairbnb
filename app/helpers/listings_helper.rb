module ListingsHelper
	def tag_links(tags) #helper method which will hold the logic of converting tags to links
		tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip)}.join(",")
	end
end
