class Comment
	include Mongoid::Document
  	include Mongoid::Timestamps
  	include Mongoid::Taggable
	belongs_to :post
	belongs_to :user
	has_many :votes
	field :body, type: String
	field :abusive, type: Boolean, default: false
	
	def get_votes_up_count
		votes = self.votes
		counter = 0
		for vote in votes
			if(vote.value == 1 )
				counter+=1
			end
		end
		return counter
	end

	def get_votes_down_count
		votes = self.votes
		counter = 0
		for vote in votes
			if(vote.value == -1 )
				counter+=1
			end
		end
		return counter
	end

	def user_voted(current_user_id)
		votes = self.votes
		for vote in votes			
			if(current_user_id==vote.user_id)
				return true
			end
		end
		false
	end
		
end
