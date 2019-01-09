function draw_grid()
    for x=0, grid_size_x, cell_width do
        love.graphics.line( x, 0, x, grid_size_y )
        
    end
    for y=0, grid_size_y, cell_width do
        love.graphics.line( 0, y, grid_size_x, y )
    end
    
end