require "settings"
require "globals"
require "poli"
require "draw"

function game_tick()
    power_this_tick = calculate_power_from_polis( )
    power = power + power_this_tick
    power_per_second = power_this_tick
end

function love.update(dt)
    second = second - dt
    if second <= 0 then
        game_tick()
        second = second + 1
    end
end


function love.mousepressed( x, y, button, istouch, presses )
    if power < poli_cost then
        return
    end

    power = power - poli_cost
    x = math.floor(x/cell_width)
    y =  math.floor(y/cell_width)
    if not grid[x][y] then
        num_polis = num_polis + 1
    else
        num_polis = num_polis - 1
    end

    grid[x][y] = not grid[x][y]
end

function love.load()
    love.graphics.setBackgroundColor( bg_color )
    love.graphics.setColor( line_color )
    love.window.setMode( grid_size_x, grid_size_y + 64, {} )
    poli = love.graphics.newImage( "Politician.jpg" )
    -- sound = love.audio.newSource("Derp Nugget.mp3", "stream")
    -- love.audio.play(sound)
end