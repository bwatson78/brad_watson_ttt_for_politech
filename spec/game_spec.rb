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
		    expect(Game::WINNING_COMBOS).to include([2,4,6])
		end
	end

	context "#initialize" do
		it "creates an instance of a game" do
			game_1 = Game.new("player1", "player2")
			expect(game_1.player_1).to be_instance_of(Human)
			expect(game_1.player_2).to be_instance_of(Computer)
			expect(game_1.board).to be_instance_of(Board)
		end
	end

	context "#play" do 
		it "asks for the players move" do
		end

		it "checks if game is over after every turn" do 
		end

		it "updates the game board" do
		end

		it "checks to see if the game is won after every turn" do
		end

		it "also checks to see if the game is a draw after every turn" do
		end

		it "stops playing if the game has been won" do
		end

		it "stops if there is a draw" do 
		end

		it "congratulates X if won" do
		end

		it "congratulates O if won" do 
		end

		it "annouces draw if tied" do
		end

		it "goes through an entire game" do
		end
	end

end