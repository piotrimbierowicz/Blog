class Comment
	include Mongoid::Document
  	include Mongoid::Timestamps
  	include Mongoid::Taggable
	belongs_to :post
	belongs_to :user
	field :content, type: String
	
end
