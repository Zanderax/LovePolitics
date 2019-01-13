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

function mouse_on_window( x, y )
    return draw_box and x > 100 and x < 350 and y > 100 and y < 350
end

function mouse_on_button( x, y )
    return x > grid_size_x - 128 and x < grid_size_x and y > grid_size_y and y < grid_size_y + 32
end

function open_window()
    draw_box = true
end

function toggle_window()
    draw_box = not draw_box
end