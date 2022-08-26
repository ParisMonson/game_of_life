require 'game'
require 'grid'

RSpec.describe "Game/Grid Integration test" do
  it "initializes with Grid Object" do
    grid = Grid.new(3, 3)
    game = Game.new(grid)
    expect(game).to be_instance_of(Game)
  end 
  it "displays the correct live cells" do
    grid = Grid.new(3, 3)
    changes = [[0, 2], [1, 1], [2, 2]]

    grid.change_values(changes)
    io_dbl = double :io
    expect(io_dbl).to receive(:puts).once.ordered.with("[[0, 2], [1, 1], [2, 2]]")
    expect(io_dbl).to receive(:puts).once.ordered.with("[[1, 1], [1, 2]]")
    expect(io_dbl).to receive(:puts).once.ordered.with("[]")
    game = Game.new(grid, io_dbl)
    game.run
  end
end