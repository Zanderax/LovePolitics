require "settings"
-- Create a array for if the grid is occupied

grid = {}
for x = 0, cells_x do
    grid[x] = {}
    for y = 0, cells_y do
        grid[x][y] = TILE_EMPTY
    end
end


selection = 1

m_key_down = false
draw_box = false

box = { 
    x = 100,
    y = 100,
    height = 250,
    width = 250,
    bar = {
        height = 25,
        close_button = {
            width = 25
        }
    }
}

