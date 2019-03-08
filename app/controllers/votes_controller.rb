class VotesController < ApplicationController
  def create
    vote_options = vote_params
    vote_options[:decision] = true

    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.js
      else
        format.json { render json: @vote.errors }
      end
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:decision, :event_id, :vote_category_id)
  end
end
