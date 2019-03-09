class EventsController < ApplicationController
  def show
    @vote_categories = VoteCategory.all.sort_by{|c| c.name }
    @event = Event.find_by(id: params[:id])
  end

  def overview
    @event = Event.find_by(id: params[:id])
    @vote_categories = VoteCategory.all.sort_by{|c| c.name }
    @vote_hash = parse_votes(@event)
  end

  def index
    @events = Event.all
  end

  def votes
    @event = Event.find_by(id: params[:id])
    @votes = Vote.where(event: @event)

    respond_to do |format|
      format.json { render json: @votes }
    end
  end

  private

  def parse_votes(event)
    output = {}
    votes = Vote.where(event_id: event.id)
    votes.each do |vote|
      if output[vote.vote_category_id]
        output[vote.vote_category_id] += 1
      else
        output[vote.vote_category_id] = 1
      end
    end
    output
  end
end
