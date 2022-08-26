class Grid
  attr_accessor :multi_array

  def initialize(row, col)
    @multi_array = Array.new(row) { Array.new(col) { 0 } }
  end

  def change_values(list_of_cells)
    list_of_cells.each do |cell|
      @multi_array[cell[0]][cell[1]] = if @multi_array[cell[0]][cell[1]].zero?
                                         1
                                       else
                                         0
                                       end
    end
  end

  def find_cells_to_change
    changes = []
    @multi_array.each_with_index do |sub_array, i|
      sub_array.each_with_index do |value, j|
        live_cells = check_surrounding_cells([i, j])
        if value.zero? && live_cells == 3
          changes.push([i, j])
        elsif value == 1 && (live_cells > 3 || live_cells < 2)
          changes.push([i, j])
        end
      end
    end
    return changes
  end

  private

  def check_surrounding_cells(cell_location)
    search_vectors = generate_search_vectors(cell_location)
    lower_vector = search_vectors[0]
    upper_vector = search_vectors[1]
    live_cells = 0
    for x in(lower_vector[0]..upper_vector[0]) do
      for y in(lower_vector[1]..upper_vector[1]) do
        if @multi_array[x][y] == 1
          live_cells += 1
        end
      end
    end
    return @multi_array[cell_location[0]][cell_location[1]] == 1 ? (live_cells - 1) : live_cells
  end

  def generate_search_vectors(cell_location)
    max_index = @multi_array.length - 1
    lower_vector = [
      (cell_location[0] > 0 ? (cell_location[0] - 1) : (cell_location[0])),
      (cell_location[1] > 0 ? (cell_location[1] - 1) : (cell_location[1]))
    ]
    upper_vector = [
      (cell_location[0] < max_index ? (cell_location[0] + 1) : (cell_location[0])),
      (cell_location[1] < max_index ? (cell_location[1] + 1) : (cell_location[1]))
    ]
    return [lower_vector, upper_vector]
  end
end
