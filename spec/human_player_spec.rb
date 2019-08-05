require "./lib/players/human.rb"
require "spec_helper"

describe "Human" do 

	it 'inherits from Player' do
	    expect(Human.ancestors).to include(Player)
	end

end