class CommentsController < ApplicationController
	before_filter :authenticate_user!
	
	def create
		@comment = current_user.comments.build(params[:comment])
		p = Post.find(params[:id])		
		@comment.save!
		p.comments << @comment
		p.save!		
	end

	def comment
	end

	def mark_as_not_abusive
		comment = Comment.find(params[:id])	
		comment.abusive = false
		comment.save!
	end

	def vote_up
		comment = Comment.find(params[:id])	
		if(!comment.user_voted(current_user.id))			
			user = current_user
			v = Vote.new
			v.value = 1
			v.save!
			user.votes  << v 
			user.save!	
			comment.votes << v
			comment.save!
		end
	end

	def vote_down
		comment = Comment.find(params[:id])	
		if(!comment.user_voted(current_user.id))
			user = current_user
			v = Vote.new
			v.value = -1
			v.save!
			user.votes  << v 
			user.save!	
			comment.votes << v			
			comment.save!
		end
  	end
end
