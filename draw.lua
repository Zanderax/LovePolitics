function draw_grid()
    for x=0, grid_size_x, cell_width do
        love.graphics.line( x, 0, x, grid_size_y )
        
    end
    for y=0, grid_size_y, cell_width do
        love.graphics.line( 0, y, grid_size_x, y )
    end
    
end

function love.draw()
    draw_grid()
    put_polis( )
    delta = love.timer.getDelta( )
    love.graphics.print("Power: " .. power, 0, grid_size_y)
    love.graphics.print("Power Per Second: " .. power_per_second, 0, grid_size_y + 16)
    love.graphics.print("Delta: " .. delta, 0, grid_size_y + 32)
end