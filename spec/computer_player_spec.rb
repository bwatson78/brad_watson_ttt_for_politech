require "./lib/players/computer.rb"
require "spec_helper"

describe "Computer" do 

	it 'inherits from Player' do
	    expect(Computer.ancestors).to include(Player)
	end

	context "#move" do
		before(:each) do 
			@go_first = Game.new(Computer.new("X"), Human.new("O"))
			@go_second = Game.new(Human.new("X"), Computer.new("O"))
			@player1 = @go_first.player_1
			@player2 = @go_second.player_2
		end

		it "takes the middle square if available" do
			expect(@player2.move(@go_second.board)).to eq("B2")
			expect(@player1.move(@go_first.board)).to eq("B2")
		end

		it "takes the first space if going second and middle taken" do
			@go_second.board.place("X", "B2")
			expect(@player2.move(@go_second.board)).to eq "A1"
		end

		it "takes a corner square on your second move after taking middle" do
			@go_first.board.place("X", "B2")
			@go_first.board.place("O", "A1")
			expect(@player1.move(@go_first.board)).to eq "A3"
		end

		it "kills the opposing corner trap by placing your piece in second space" do
			@go_second.board.place("X", "A1")
			@go_second.board.place("O", "B2")
			@go_second.board.place("X", "C3")
			expect(@player2.move(@go_second.board)).to eq "A2"
		end
	end

end