require "./lib/game.rb"
require "spec_helper"

describe "Game" do 
	before(:each) do 
		@game = Game.new(Human.new("X"), Computer.new("O"))
	end

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
			expect(@game.player_1).to be_instance_of(Human)
			expect(@game.player_2).to be_instance_of(Computer)
			expect(@game.board).to be_instance_of(Board)
		end
	end

	context "#current_player" do
		it "returns the player that goes next (player1)" do
			@game.board.spaces = ["X", "O", "X", " ", " ", " ", " ", " ", " "]
			expect(@game.current_player).to eq(@game.player_2)
		end

		it "returns the player that goes next (player2)" do
			@game.board.spaces = ["X", "O", "X", "X", " ", " ", " ", " ", " "]
			expect(@game.current_player).to eq(@game.player_1)
		end
	end

	context "#won?" do
		it "returns the winning combo if the game has been won" do 
			@game.board.spaces = ["X", "X", "X", "O", " ", " ", " ", " ", " "]
			expect(@game.won?).to eq([0, 1, 2])
		end

		it "returns false if no win found" do 
			@game.board.spaces = ["X", "O", "X", "O", " ", " ", " ", " ", " "]
			expect(@game.won?).to eq(false)
		end
	end

	context "#draw?" do
		it "returns true if board is full and nobody won" do
			@game.board.spaces = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
			expect(@game.draw?).to eq(true)
		end

		it "returns false if board is full and somebody won" do
			@game.board.spaces = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
			expect(@game.draw?).to eq(false)
		end

		it "returns false if the game board isn't full" do
			@game.board.spaces = ["X", "X", "X", "O", " ", " ", " ", " ", " "]
			expect(@game.draw?).to eq(false)
		end
	end

	context "#over" do
		it "returns true if game has been won" do 
			@game.board.spaces = ["X", "X", "X", "O", " ", " ", " ", " ", " "]
			expect(@game.over?).to eq(true)
		end

		it "returns true if game ends in draw" do 
			@game.board.spaces = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
			expect(@game.over?).to eq(true)
		end

		it "returns true if board is full" do
			@game.board.spaces = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
			expect(@game.over?).to eq(true)
		end

		it "returns false if game is in progress" do 
			@game.board.spaces = ["X", "O", "X", "O", " ", " ", " ", " ", " "]
			expect(@game.over?).to eq(false)
		end
	end

	context "#winner" do
		it "returns player_1 when they win" do
			@game.board.spaces = ["X", "X", "X", "O", " ", " ", " ", " ", " "]
			expect(@game.winner).to eq(@game.player_1)
		end

		it "returns player_2 when they win" do 
			@game.board.spaces = ["O", "O", "O", "X", " ", " ", " ", " ", " "]
			expect(@game.winner).to eq(@game.player_2)
		end
	end

end