require "globals"

function draw_window()
    if draw_box then
        love.graphics.rectangle( "fill", 100, 100, 250, 250 )
    end
end

function draw_button()
    love.graphics.rectangle( "fill", grid_size_x - 128, grid_size_y, 128, 32 )
end

function draw_gui_layer()
    draw_window()
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