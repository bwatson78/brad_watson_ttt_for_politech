require "./lib/players/computer.rb"
require "spec_helper"

describe "Computer" do 

	it 'inherits from Player' do
	    expect(Computer.ancestors).to include(Player)
	end

end