require "settings"
require "globals"
require "poli"
require "draw"
require "gui"

function process_input()
    if love.keyboard.isDown( "1" ) then
        selection = TILE_POLI
    end
    if love.keyboard.isDown( "2" ) then
        selection = TILE_COUNCIL
    end
end

function game_tick()
    power_this_tick = calculate_power_from_polis( )
    power = power + power_this_tick
    power_per_second = power_this_tick
end

function love.update(dt)
    process_input()
    second = second - dt
    if second <= 0 then
        game_tick()
        second = second + 1
    end
end

function love.draw()
    draw_grid()
    put_polis()
    draw_gui_layer()
    delta = love.timer.getDelta( )
    love.graphics.print("Power: " .. power, 0, grid_size_y)
    love.graphics.print("Power Per Second: " .. power_per_second, 0, grid_size_y + 16)
    love.graphics.print("Delta: " .. delta, 0, grid_size_y + 32)
    love.graphics.print("Selection: " .. selection, 0, grid_size_y + 48)
end

function left_mouse( x, y )
    if selection == TILE_POLI and power >= poli_cost then
        power = power - poli_cost
        num_polis = num_polis + 1
    end

    if selection == TILE_COUNCIL and power >= council_cost then
        power = power - council_cost
    end

    grid[x][y] = selection
end

function right_mouse( x, y )
    grid[x][y] = TILE_EMPTY
end

function click_on_grid( x, y, button )
    x = math.floor(x/cell_width)
    y =  math.floor(y/cell_width)
    if button == 1 then
        left_mouse( x, y )
    elseif button == 2 then
        right_mouse( x, y )
    end
end

function love.mousepressed( x, y, button, istouch, presses )
    if is_mouse_on_gui( x, y ) then
        handle_gui_input( x, y )
        return
    end
    if x <= grid_size_x and y <= grid_size_y then
        click_on_grid( x, y, button )
    end
end

function love.load()
    love.graphics.setBackgroundColor( bg_color )
    love.graphics.setColor( line_color )
    love.window.setMode( grid_size_x, grid_size_y + 64, {} )
    poli = love.graphics.newImage( "Politician.jpg" )
    council= love.graphics.newImage( "council.jpg" )
    sound = love.audio.newSource("Derp Nugget.mp3", "stream")
    -- love.audio.play(sound)
end