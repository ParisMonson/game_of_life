require 'grid'

RSpec.describe 'Grid' do
  it "initializes" do
    grid = Grid.new(3, 3)
    expect(grid).to be_instance_of(Grid)
  end
  it "contains 3 rows and columns" do
    grid = Grid.new(3, 3)
    expect(grid.multi_array.length).to eq(3)
    expect(grid.multi_array[0].length).to eq(3)
    expect(grid.multi_array[1].length).to eq(3)
    expect(grid.multi_array[2].length).to eq(3)
  end
  it "the values of the grid cells are 0" do
    grid = Grid.new(3, 3)
    expect(grid.multi_array[0][0..2]).to eq([0, 0, 0]) 
    expect(grid.multi_array[1][0..2]).to eq([0, 0, 0]) 
    expect(grid.multi_array[2][0..2]).to eq([0, 0, 0]) 
  end
  it "changes correct cell from 0 to 1" do
    grid = Grid.new(3, 3)
    changes = [[1, 1]]
    grid.change_values(changes)
    expect(grid.multi_array[1][1]).to eq(1)
  end
  it "changes correct cell from 1 back to 0" do
    grid = Grid.new(3, 3)
    changes = [[1, 1]]
    grid.change_values(changes)

    changes2 = [[1, 1]]
    grid.change_values(changes2)
    expect(grid.multi_array[1][1]).to eq(0)
  end
  it "changes correct cells from 0 to 1 when multiple changes are given" do
    grid = Grid.new(3, 3)
    changes = [[1, 1], [0, 2]]
    grid.change_values(changes)

    expect(grid.multi_array[1][1]).to eq(1)
    expect(grid.multi_array[0][2]).to eq(1)
  end

end