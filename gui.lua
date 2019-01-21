require "globals"

function draw_window( )
    local x = box.x
    local y = box.y
    local height = box.height
    local width = box.width
    if draw_box then
        love.graphics.rectangle( "fill", box.x, box.y, box.width, box.height )
        draw_x_close_button( box.x, box.y )
        draw_header_line( box.x, box.y )
    end
end

function draw_header_line( x, y )
    local x = box.x
    local y = box.y
    local height = box.bar.height
    local width = box.width
    r, g, b, a = love.graphics.getColor()
    love.graphics.setColor( gui_box_color )
    -- Box Lines
    love.graphics.line( x, y + height, x + width, y + height )
    love.graphics.setColor( r, g, b, a )
end

function draw_x_close_button( x, y )
    local x = box.x
    local y = box.y
    local box_width = box.width
    local button_height = box.bar.height
    local button_width = box.bar.close_button.width
    local button_x = x + box_width - button_width

    r, g, b, a = love.graphics.getColor()
    love.graphics.setColor( gui_box_color )
    -- Box Lines
    love.graphics.line( 
        button_x, y,
        button_x, y + button_height,
        x + box_width, y + button_height )
    -- X Lines
    love.graphics.line( button_x, y, x + box_width, y + button_height )
    love.graphics.line( x + box_width, y, button_x, y + button_height )    
    love.graphics.setColor( r, g, b, a )
end    

function draw_gui_layer()
    draw_window( )
end

function close_window()
    draw_box = false
end

function is_mouse_on_window( x, y )
    return draw_box and x > 100 and x < 350 and y > 100 and y < 350
end

function is_mouse_on_button( x, y )
    return x > box.x + box.width - box.bar.close_button.width
        and x < box.x + box.width
        and y > box.y
        and y < box.y + box.bar.height + 32
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
    if is_mouse_on_button( x, y )
        and button == LEFT_MOUSE 
        and draw_box then
        toggle_window()
    end
end