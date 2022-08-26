require 'grid'

RSpec.describe 'Grid' do
  describe "Changing Values" do
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
  describe "Finding values to change" do
    it "finds the correct 3 cells to change" do
      grid = Grid.new(3, 3)
      live_cells = [[0, 2], [1, 1], [2, 2]]
      grid.change_values(live_cells)

      changes = grid.find_cells_to_change
      expect(changes.length).to eq(3)
      expect(changes[0]).to eq([0, 2])
      expect(changes[1]).to eq([1, 2])
      expect(changes[2]).to eq([2, 2])
    end
    it "finds the correct 2 cells to change" do
      grid = Grid.new(3, 3)
      live_cells = [[0, 0], [1, 1]]
      grid.change_values(live_cells)

      changes = grid.find_cells_to_change

      expect(changes.length).to eq(2)
      expect(changes[0]).to eq([0, 0])
      expect(changes[1]).to eq([1, 1])
    end
    it "finds the correct 2 cells to change in larger grid" do
      grid = Grid.new(10, 10)
      live_cells = [[4, 4], [5, 5]]
      grid.change_values(live_cells)

      changes = grid.find_cells_to_change

      expect(changes.length).to eq(2)
      expect(changes[0]).to eq([4, 4])
      expect(changes[1]).to eq([5, 5])
    end
    
  end
  describe "Finds all live cells (cells with a value of 1)" do
    it "finds the correct 3 live cells" do
      grid = Grid.new(3, 3)
      live_cells = [[0, 2], [1, 1], [2, 2]]
      grid.change_values(live_cells)

      live_cells = grid.find_live_cells
      expect(live_cells.length).to eq(3)
      expect(live_cells[0]).to eq([0, 2])
      expect(live_cells[1]).to eq([1, 1])
      expect(live_cells[2]).to eq([2, 2])


    end

  end

end