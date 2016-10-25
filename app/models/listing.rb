class Listing < ActiveRecord::Base
	belongs_to :user
	has_many :taggings
	has_many :tags, through: :taggings

	def all_tags=(names)
		self.tags = names.split(",").map do |name|
			Tag.where(name: name.strip).first_or_create!
		end
	end

	def all_tags
		self.tags.map(&:name).join(",")
	end

	def self.tagged_with(name) #to search by tag
		Tag.find_by_name!(name).listings	
	end	

	def self.tag_counts #to create tag cloud
		Tag.select("tags.*, count(taggings.tag_id) as count").joins(:taggings).group("taggings.tag_id")	
	end
end
