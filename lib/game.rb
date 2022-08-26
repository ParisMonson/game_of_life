class Game
  def initialize(grid_object)
    @grid = grid_object
  end

  def game_tick
    loop do
      changes = @grid.find_cells_to_change
      @grid.change_values(changes)
      break if changes.empty?
      display_game
    end
  end
  def display_game
    return nil
  end
end