require "settings"
require "globals"
-- Pul poli in cell
function put_poli( grid, x, y )
    love.graphics.draw( poli, x*cell_width, y*cell_width, 0, poli_scale, poli_scale )
end

-- Put a poli in all cells in the grid that are true
function put_polis( )
    for x = 0, cells_x do
        for y = 0, cells_y do
            if grid[x][y] then
                put_poli( grid, x, y )
                local poli_power = calculate_power_from_poli( x, y )
                love.graphics.setColor( power_color )
                love.graphics.print( poli_power, x*cell_width, y*cell_width)
                love.graphics.setColor( line_color )
            end
        end
    end
end

function calculate_power_from_poli( x, y)
    neighbours = 0
    if x < cells_x then
        if grid[x+1][y] then
            neighbours = neighbours + 1
        end
        if y < cells_y and grid[x+1][y+1] then
            neighbours = neighbours + 1
        end
        if y > 0 and grid[x+1][y-1] then
            neighbours = neighbours + 1
        end
    end
    if x > 0 then
        if grid[x-1][y] then
            neighbours = neighbours + 1
        end
        if y < cells_y and grid[x-1][y+1] then
            neighbours = neighbours + 1
        end
        if y > 0 and grid[x-1][y-1] then
            neighbours = neighbours + 1
        end
    end
    if y < cells_y and grid[x][y+1] then
        neighbours = neighbours + 1
    end
    if y > 0 and grid[x][y-1] then
        neighbours = neighbours + 1
    end

    return neighbours + 1
end


function calculate_power_from_polis( )
    power_from_polis = 0  
    for x = 0, cells_x do
        for y = 0, cells_y do
            if grid[x][y] then
                power_from_polis = power_from_polis + calculate_power_from_poli( x, y )
            end
        end
    end
    return power_from_polis
end