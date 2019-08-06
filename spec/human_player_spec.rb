require "./lib/players/human.rb"
require "spec_helper"

describe "Human" do 

	it 'inherits from Player' do
	    expect(Human.ancestors).to include(Player)
	end

	context "#move" do
		before(:each) do
			@player = Human.new("X")
		end

		it "should call the ask_for_move dialogue" do 
			expect(Dialogue).to receive(:ask_for_move)
			@player.move
		end

		it "should get user's input and return it" do
			allow($stdin).to receive(:gets).and_return('B1')
			move = $stdin.gets
			expect(move).to eq('B1')
		end
	end

end