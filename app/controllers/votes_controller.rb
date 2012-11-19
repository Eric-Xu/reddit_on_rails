class VotesController < ApplicationController
  # Set up Devise user authentication
  before_filter :authenticate_user!

  def create
  	@vote = current_user.votes.create(params[:vote])
  	redirect_to :back
  end
end