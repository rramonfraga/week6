class MatchesController < ApplicationController

  def index
    matches = Match.search_matches_for_player params[:id]
    render json: matches
  end

  def faction
  end

end
