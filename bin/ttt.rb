#!/usr/bin/env ruby

require_relative '../config/environment'

Dialogue.begin
piece = gets.strip
until ["x", "o"].include? piece.downcase
	Dialogue.try_again
	piece = gets.strip
end
if piece.downcase == "x"
	game = Game.new(Human.new("X"), Computer.new("O"))
else 
	game = Game.new(Computer.new("X"), Human.new("O"))
end
game.play until game.over?
Dialogue.goodbye

