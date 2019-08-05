require "./lib/board.rb"
require "spec_helper"

describe "Board" do

	context "#initialize" do
		it "creates an instance of a board" do
			board = Board.new
			expect(board.spaces).to eq(["", "", "", "", "", "", "", "", ""])
		end
	end

end 