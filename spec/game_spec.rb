require 'game'

RSpec.describe 'Game' do
  it "initializes" do
    grid_dbl = double :grid
    game = Game.new(grid_dbl)
    expect(game).to be_instance_of(Game)
  end
  # xit "performs one game tick before quitting" do
  #   grid_dbl = double :grid
  #   allow(grid).to receive()
  #   game = Game.new(grid)
  #   expect(game).to be_instance_of(Game)
  # end
end