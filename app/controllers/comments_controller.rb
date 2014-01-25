class CommentsController < ApplicationController
	before_filter :authenticate_user!

	def create
		@comment = current_user.comments.build(params[:comment])
		p = Post.find(params[:id])		
		@comment.save!
		p.comments << @comment
		p.save!		
	end


end
