require "pry"
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
#Helper method 
def get_info_about_player(name, info=nil)
    game_hash.each do |team|
    team[1][:players].each do |players|
      if players[:player_name] == name
        if info
          return players[info]
        else 
          return players
        end 
      end 
    end 
  end 
end 

#Helper method 
def get_team_info(team_name, info)
  game_hash.each do |team|
    if team[1][:team_name] == team_name 
      return team[1][info]
    end 
  end 
end 



def num_points_scored(player)
  get_info_about_player(player, :points)
end 


def shoe_size(player)
  get_info_about_player(player, :shoe)
end 


def team_colors(name)
  get_team_info(name, :colors)
end 

def team_names
  game_hash.reduce([]) do |memo,(key, value)|
    memo << game_hash[key][:team_name] 
    memo 
  end 
end 

def player_numbers(name)
  players_data= get_team_info(name, :players)
  players_data.reduce([]) do |memo, (player)|
   memo << player[:number]
   memo 
  end 
end 

def player_stats(player)
  get_info_about_player(player)
end 


def big_shoe_rebounds 
  largest_shoe_size = 0 
  player_with_shoe = "" 
  
  get_team_info("Brooklyn Nets", :players).each do |player|
    
    if player[:shoe] > largest_shoe_size
      largest_shoe_size = player[:shoe]
      player_with_shoe = player[:player_name]
    end 
  end 
    
  get_team_info("Charlotte Hornets", :players).each do |player|
    if player[:shoe] > largest_shoe_size
      largest_shoe_size = player[:shoe]
      player_with_shoe = player[:player_name]
    end 
  end 
  
   get_info_about_player(player_with_shoe, :rebounds)
end 
