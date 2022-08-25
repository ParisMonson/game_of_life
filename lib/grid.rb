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
end
