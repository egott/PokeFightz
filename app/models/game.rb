class Game < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :pokemon_games
  has_many :pokemons, :through => :pokemon_games


  def computer_pokemon(a,b,c,d,e)
    @computer_team = [Pokemon.all.sample,Pokemon.all.sample,Pokemon.all.sample,Pokemon.all.sample,Pokemon.all.sample]
  end

  def computer_types(i)
    @computer_team = [Pokemon.all[7],Pokemon.all[12],Pokemon.all[17],Pokemon.all[45],Pokemon.all[49]]
    enemy_types = []
    @computer_team[i].types.each do |type|
      enemy_types << type.name
    end
    enemy_types
  end

  def half_damage_from(i)
    half_from_types = []
    self.pokemons[i].types.each do |type|
        half_from_types.concat(type.half_damage_from)
    end
    self.computer_types(i).each do |com_type|
      if half_from_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def no_damage_from(i)
    no_from_types = []
    self.pokemons[i].types.each do |type|
        no_from_types.concat(type.no_damage_from)
    end
    self.computer_types(i).each do |com_type|
      if no_from_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def double_damage_from(i)
    double_from_types = []
    self.pokemons[i].types.each do |type|
        double_from_types.concat(type.double_damage_from)
    end
    self.computer_types(i).each do |com_type|
      if double_from_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def half_damage_to(i)
    half_to_types = []
    self.pokemons[i].types.each do |type|
      half_to_types.concat(type.half_damage_to)
    end
    self.computer_types(i).each do |com_type|
      if half_to_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def no_damage_to(i)
    no_to_types = []
    self.pokemons[i].types.each do |type|
      no_to_types.concat(type.no_damage_to)
    end
    self.computer_types(i).each do |com_type|
      if no_to_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  def double_damage_to(i)
    double_to_types = []
    self.pokemons[i].types.each do |type|
      double_to_types.concat(type.double_damage_to)
    end
    self.computer_types(i).each do |com_type|
      if double_to_types.uniq.include?(com_type)
        return true
        break
      end
    end
  end

  #give in 5 indexes for enemy pokemons

  #calculate damage
  def calculate_damage_to(i)
    damage_to = 1
    if self.no_damage_to(i) == true
      damage_to = 0
    else
      if self.half_damage_to(i) == true
        damage_to *= 0.5
      end
      if self.double_damage_to(i) == true
        damage_to *= 2
      end
    end
    damage_to
  end
  #calculate damage from
  def calculate_damage_from(i)
    damage_from = 1
    if self.no_damage_from(i) == true
      damage_from = 0
    else
      if self.half_damage_from(i) == true
        damage_from *= 0.5
      end
      if self.double_damage_from(i) == true
        damage_from *= 2
      end
    end
    damage_from
  end

  def fight_winner(i)
    winner = ""
    if calculate_damage_to(i) > calculate_damage_from(i)
      winner = "player"
    elsif calculate_damage_to(i) < calculate_damage_from(i)
      winner = "computer"
    end
    winner
  end

  def game_winner
    game = { player_points: 0, computer_points: 0 }
    (0..4).each do |n|
      if fight_winner(n) == "player"
        game[:player_points] += 1
      elsif fight_winner(n) == "computer"
        game[:computer_points] += 1
      end
    end
    game
  end


end
