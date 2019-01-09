-- Create a array for if the grid is occupied
grid = {}
for x = 0, cells_x do
    grid[x] = {}
    for y = 0, cells_y do
        grid[x][y] = false
    end
end