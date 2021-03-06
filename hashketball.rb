require "pry"

def game_hash
  {
    home: {team_name: "Brooklyn Nets", 
                  colors: ["Black", "White"], 
                  players: [{player_name: "Alan Anderson",
                            number: 0,
                            shoe: 16,
                            points: 22,
                            rebounds: 12,
                            assists: 12,
                            steals: 3,
                            blocks: 1,
                            slam_dunks: 1},
                            {player_name: "Reggie Evans",
                            number: 30,
                            shoe: 14,
                            points: 12,
                            rebounds: 12,
                            assists: 12,
                            steals: 12,
                            blocks: 12,
                            slam_dunks: 7},
                            {player_name: "Brook Lopez",
                            number: 11,
                            shoe: 17,
                            points: 17,
                            rebounds: 19,
                            assists: 10,
                            steals: 3,
                            blocks: 1,
                            slam_dunks: 15},
                            {player_name: "Mason Plumlee",
                            number: 1,
                            shoe: 19,
                            points: 26,
                            rebounds: 11,
                            assists: 6,
                            steals: 3,
                            blocks: 8,
                            slam_dunks: 5},
                            {player_name: "Jason Terry",
                            number: 31,
                            shoe: 15,
                            points: 19,
                            rebounds: 2,
                            assists: 2,
                            steals: 4,
                            blocks: 11,
                            slam_dunks: 1},
                            ]
                }, 
          away: {team_name: "Charlotte Hornets", 
                  colors: ["Turquoise", "Purple"], 
                  players: [{player_name: "Jeff Adrien",
                            number: 4,
                            shoe: 18,
                            points: 10,
                            rebounds: 1,
                            assists: 1,
                            steals: 2,
                            blocks: 7,
                            slam_dunks: 2},
                            {player_name: "Bismack Biyombo",
                            number: 0,
                            shoe: 16,
                            points: 12,
                            rebounds: 4,
                            assists: 7,
                            steals: 22,
                            blocks: 15,
                            slam_dunks: 10},
                            {player_name: "DeSagna Diop",
                            number: 2,
                            shoe: 14,
                            points: 24,
                            rebounds: 12,
                            assists: 12,
                            steals: 4,
                            blocks: 5,
                            slam_dunks: 5},
                            {player_name: "Ben Gordon",
                            number: 8,
                            shoe: 15,
                            points: 33,
                            rebounds: 3,
                            assists: 2,
                            steals: 1,
                            blocks: 1,
                            slam_dunks: 0},
                            {player_name: "Kemba Walker",
                            number: 33,
                            shoe: 15,
                            points: 6,
                            rebounds: 12,
                            assists: 12,
                            steals: 7,
                            blocks: 5,
                            slam_dunks: 12},
                            ]
                }
          }
end

def num_points_scored(name)
  #return points for specific player
  game_hash.each do |level, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name
            return player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  #return shoe size for specific player
  game_hash.each do |level, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name
            return player[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  #return the team colors
  game_hash.each do |level, team|
      if team[:team_name] == team_name
        return team[:colors]
    end
  end
end

def team_names
  #return team names
  game_hash.map do |field, team|
    team[:team_name]
  end
end

def player_numbers(team_name)
  #return array of jersey numbers for that team_name
  numbers = []
  game_hash.each do |field, team|
    if team[:team_name] == team_name
      team.each do |attribute, data|
        if attribute == :players
          data.each do |player|
            numbers << player[:number]
          end
        end
      end
    end
  end
numbers
end

def player_stats(name)
  new_hash = {}
  game_hash.each do |field, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end
          end
        end
      end
    end
  end
new_hash
end

def big_shoe_rebounds
  big_foot = 0 
  rebounds = 0 
  game_hash.each do |field, team|
    team[:players].each do |player|
      if player[:shoe] > big_foot
        big_foot = player[:shoe]
        rebounds = player[:rebounds]
      end
    end
  end
  return rebounds
end
    
#bonus methods

def most_points_scored
  most_points = 0
  mvp = 0
  game_hash.each do |field, team|
    team[:players].each do |player|
      if player[:points] > most_points
        most_points = player[:points]
        mvp = player[:player_name]
    end
  end
end
return mvp
end

def winning_team
  total_home = 0
  total_away = 0
  game_hash.each do |field, team|
    if field == :home
    team[:players].each do |player|
      total_home += player[:points]
      end
    else
    team[:players].each do |player|
    total_away += player[:points]
  end
  end
  end
  if total_home > total_away
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  long_name = 0 
  long_player = ""
  game_hash.each do |field, team|
    team[:players].each do |player|
      if player[:player_name].length > long_name
        long_name = player[:player_name].length
        long_player = player[:player_name]
      end
    end
  end
  long_player
end

##SUPER BONUS!!!!

def long_name_steals_a_ton?
  steals_total = 0
  steal_player = 0
  game_hash.each do |field, team|
   team[:players].each do |player|
     if player[:steals] > steals_total
       steals_total = player[:steals]
       steal_player = player[:player_name]
     end
   end
  end
  if player_with_longest_name == steal_player
    return true
  end
end



