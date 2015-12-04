class Match < ActiveRecord::Base
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  def self.search_matches_for_player player_id
    sql_inner_join = "INNER JOIN 'players' ON 'players'.'id' = 'matches'.'winner_id'"
    sql_where = "'players'.'id' = #{player_id}"

    Match.joins(sql_inner_join).where(sql_where).order(:winner_faction)
  end

  def self.search_faction player_id, faction
    sql_inner_join = "INNER JOIN 'players' ON 'players'.'id' = 'matches'.'winner_id'"
    sql_where = "'players'.'id' = #{player_id}"

    Match.where(sql_where).
          joins(sql_inner_join).
          where("winner_faction = ? or loser_faction = ?", faction)
  end

end
