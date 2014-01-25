class Vote
	include Mongoid::Document
  	include Mongoid::Timestamps
  	include Mongoid::Taggable

	belongs_to :comment
	belongs_to :user
	field :value , type: Boolean
	
end
