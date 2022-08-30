require 'game'

RSpec.describe 'Game' do
  it "initializes" do
    grid_dbl = double :grid
    game = Game.new(grid_dbl)
    expect(game).to be_instance_of(Game)
  end
  it "performs two game tick before quitting" do
    grid_dbl = double :grid
    allow(grid_dbl).to receive(:find_live_cells).and_return([[0, 0], [1, 1]])
    allow(grid_dbl).to receive(:find_cells_to_change).and_return([[0, 0], [1, 1]])
    allow(grid_dbl).to receive(:change_values).with([[0, 0], [1, 1]])
    allow(grid_dbl).to receive(:find_cells_to_change).and_return([])
    io_dbl = double :io
    expect(io_dbl).to receive(:puts).with("[[0, 0], [1, 1]]")
    game = Game.new(grid_dbl, io_dbl)
    game.run
  end
end