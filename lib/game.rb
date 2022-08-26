class Game
  def initialize(grid_object, io=Kernel)
    @grid = grid_object
    @io = io
  end

  def run
    loop do
      display_board
      changes = @grid.find_cells_to_change
      break if changes.empty?
      @grid.change_values(changes)
    end
  end
  def display_board
    live_cells = @grid.find_live_cells
    @io.puts "#{live_cells}"
  end
end