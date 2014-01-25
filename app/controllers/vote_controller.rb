class VoteController < ApplicationController
  before_filter :authenticate_user!

 #  def vote_up
	# comment = Comment.find(params[:id])	
	# user = current_user
	# v = Vote.new
	# v.value = 1
	# v.save!
	# user.votes  << v 
	# user.save!	
	# comment.votes << v
	# comment.save!
 #  end

 #  def vote_down
	# comment = Comment.find(params[:id])	
	# user = current_user
	# v = Vote.new
	# v.value = 0
	# v.save!
	# user.votes  << v 
	# user.save!	
	# comment.votes << v
	# if comment.abusive?
	# 	comment.abusive = true
	# end
	# comment.save!
 #  end

end