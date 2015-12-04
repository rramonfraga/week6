# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def create_players (number)
  number.times do |index|
    Player.create name: "Player #{index}"
  end
end

def random_faction
  ["Terran", "Zerg","Protos"][ Random.new.rand(3) ]
end

def create_matches (number, number_player)
  number.times do |index|
    new_player, other_player = Random.new.rand(number_player)
    while other_player == new_player
      other_player = Random.new.rand(number_player)
    end
    Match.create  winner_faction: random_faction, 
                  loser_faction: random_faction, 
                  duration: Time.now, 
                  date: Date.today, 
                  winner_id: Random.new.rand(number_player),
                  loser_id: Random.new.rand(number_player)
  end
end

create_players( 16 );
create_matches( 15, 16); 