require "settings"
require "globals"

function put_council( grid, x, y )
    love.graphics.draw( council, x*cell_width, y*cell_width, 0, poli_scale, poli_scale )
end

-- Pul poli in cell
function put_poli( grid, x, y, poli_power )
    love.graphics.draw( poli, x*cell_width, y*cell_width, 0, poli_scale, poli_scale )
    love.graphics.setColor( power_color )
    love.graphics.print( poli_power, x*cell_width, y*cell_width)
    love.graphics.setColor( line_color )
end

-- Put a poli in all cells in the grid that are true
function put_polis( )
    for x = 0, cells_x do
        for y = 0, cells_y do
            if grid[x][y] == TILE_POLI then
                poli_power = calculate_power_from_poli( x, y )
                put_poli( grid, x, y, poli_power )                
            end
            if grid[x][y] == TILE_COUNCIL then
                put_council( grid, x, y )
            end
        end
    end
end

function handle_neighbour( power, neighbour )
    if neighbour == 1 then
        return power + 1
    elseif neighbour == 2 then
        return power * 2
    end
    return power
end

function calculate_power_from_poli( x, y)
    poli_power = 1
    if x < cells_x then
        poli_power = handle_neighbour( poli_power, grid[x+1][y] )
        if y < cells_y then
            poli_power = handle_neighbour( poli_power, grid[x+1][y+1] )
        end
        if y > 0 then
            poli_power = handle_neighbour( poli_power, grid[x+1][y-1] )
        end
    end
    if x > 0 then
        poli_power = handle_neighbour( poli_power, grid[x-1][y] )
        if y < cells_y then
            poli_power = handle_neighbour( poli_power, grid[x-1][y+1] )
        end
        if y > 0 then
            poli_power = handle_neighbour( poli_power, grid[x-1][y-1] )
        end
    end
    if y < cells_y then
        poli_power = handle_neighbour( poli_power, grid[x][y+1] )
    end
    if y > 0 then
        poli_power = handle_neighbour( poli_power, grid[x][y-1] )
    end

    return poli_power
end


function calculate_power_from_polis( )
    power_from_polis = 0  
    for x = 0, cells_x do
        for y = 0, cells_y do
            if grid[x][y] == 1 then
                power_from_polis = power_from_polis + calculate_power_from_poli( x, y )
            end
        end
    end
    return power_from_polis
end