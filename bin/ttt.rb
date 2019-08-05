#!/usr/bin/env ruby

require_relative '../config/environment'

Dialogue.begin
piece = gets.strip
until ["x", "o"].include? piece.downcase
	Dialogue.try_again
	piece = gets.strip
end
game = (piece.downcase == "x" ? Game.new("X", "O") : Game.new("O", "X"))
Dialogue.goodbye

