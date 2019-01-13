require "globals"

function draw_window( x, y )
    if draw_box then
        love.graphics.rectangle( "fill", x, y, 250, 250 )
        draw_x_close_button( x, y )
        draw_header_line( x, y )
    end
end

function draw_header_line( x, y )
    r, g, b, a = love.graphics.getColor()
    love.graphics.setColor( gui_box_color )
    -- Box Lines
    love.graphics.line( x, y + 25, x + 250, y + 25 )
    love.graphics.setColor( r, g, b, a )
end

function draw_x_close_button( x, y )
    r, g, b, a = love.graphics.getColor()
    love.graphics.setColor( gui_box_color )
    -- Box Lines
    love.graphics.line( x + 225, y, x + 225, y + 25, x + 250, y + 25 )
    -- X Lines
    love.graphics.line( x + 225, y, x + 250, y + 25 )
    love.graphics.line( x + 250, y, x + 225, y + 25 )    
    love.graphics.setColor( r, g, b, a )
end    

function draw_button()
    love.graphics.rectangle( "fill", grid_size_x - 128, grid_size_y, 128, 32 )
end

function draw_gui_layer()
    draw_window( 0, 0 )
    draw_button()
end

function close_window()
    draw_box = false
end

function is_mouse_on_window( x, y )
    return draw_box and x > 100 and x < 350 and y > 100 and y < 350
end

function is_mouse_on_button( x, y )
    return x > grid_size_x - 128 and x < grid_size_x and y > grid_size_y and y < grid_size_y + 32
end

function open_window()
    draw_box = true
end

function toggle_window()
    draw_box = not draw_box
end

function is_mouse_on_gui( x, y )
    return is_mouse_on_button( x, y ) or is_mouse_on_window( x, y )
end

function handle_gui_input( x, y, button )
    if is_mouse_on_button( x, y ) and button == LEFT_MOUSE then
        toggle_window()
    end
end