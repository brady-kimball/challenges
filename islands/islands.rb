# @param {Character[][]} grid
# @return {Integer}

def num_islands(grid)
  id_grid = Array.new(grid.length) {Array.new(grid[0].length, 0)}
  grid = grid.map{ |row| row.chars.map(&:to_i) }
  next_id = 1
  p id_grid
  grid.each_with_index do |roww, i|
    roww.each_index do |j|
      if grid[i][j] == 1
        if ((id_grid[i - 1][j] == 0 || id_grid[i - 1][j] == nil) &&
          (id_grid[i][j - 1] == 0 || id_grid[i][j - 1] == nil))
          id_grid[i][j] = next_id
          next_id += 1
        else
          id_grid[i][j] = [id_grid[i - 1][j], id_grid[i][j - 1]].select{ |num| num && num > 0 }.min
        end
      else
        id_grid[i][j] = 0
      end
    end
  end
  # id_grid
  p id_grid
  id_grid.flatten.select{|num| num > 0}.uniq.length
end

p num_islands(["111","010","111"])
