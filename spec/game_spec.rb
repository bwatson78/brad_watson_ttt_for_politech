require "./lib/game.rb"
require "spec_helper"

describe "Game" do 
	context "::WINNING_COMBOS" do
		it "includes all possible Winning Combinations" do
			expect(Game::WINNING_COMBOS).to include([0,1,2])
		    expect(Game::WINNING_COMBOS).to include([3,4,5])
		    expect(Game::WINNING_COMBOS).to include([6,7,8])
		    expect(Game::WINNING_COMBOS).to include([0,3,6])
		    expect(Game::WINNING_COMBOS).to include([1,4,7])
		    expect(Game::WINNING_COMBOS).to include([2,5,8])
		    expect(Game::WINNING_COMBOS).to include([0,4,8])
		    expect(Game::WINNING_COMBOS).to include([2, 4, 6])
		end
	end

	context "#initialize" do
		it "creates an instance of a game" do
			game_1 = Game.new("player1", "player2", "board")
			expect(game_1.player1).to eq("player1")
			
		end


end