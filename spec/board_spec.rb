require "./lib/board.rb"
require "spec_helper"

describe "Board" do

	context "#initialize" do
		it "creates an instance of a board" do
			board = Board.new
			expect(board.spaces).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
		end
	end

	context "#show" do
		it "displays the board correctly" do
			board = Board.new
			expect do 
				board.show
			end.to output("      A   B   C\n    +---+---+---+\n1   |   |   |   |\n    +---+---+---+\n2   |   |   |   |\n    +---+---+---+\n3   |   |   |   |\n    +---+---+---+\n"	).to_stdout
		end
	end

end 