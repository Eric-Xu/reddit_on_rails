class VotesController < ApplicationController
  # Set up Devise user authentication
  before_filter :authenticate_user!

  def create
	@vote = Vote.where(:link_id => params[:vote][:link_id], :user_id => current_user.id).first
	if @vote
	  @vote.up = params[:vote][:up]
	  @vote.save
	else
	  @vote = current_user.votes.create(params[:vote])
	end
	redirect_to :back
	# Can also be written using fancier boolean logic:
	# @vote = current_user.votes.where(:link_id => params[:vote][:link_id]).first
	# @vote ||= current_user.votes.create(params[:vote])
	# @vote.update_attributes(:up => params[:vote][:up])
  end
end