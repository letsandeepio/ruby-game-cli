# frozen_string_literal: true

class Player
  attr_accessor :chances, :name
  def initialize(name, chances)
    @name = name
    @chances = chances
  end

  def lose_chance
    @chances -= 1
  end

  def lost?
    @chances.zero?
  end
end
