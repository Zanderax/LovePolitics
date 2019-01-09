local grid_size_x = 640
local grid_size_y = 640
local cell_width = 64
local cells_x = grid_size_x / cell_width
local cells_y = grid_size_y / cell_width
local poli_size = 1856
local poli_scale = cell_width / poli_size

local bg_color = { 0.169, 0.114, 0.227, 255 }
local line_color = { 0.529, 0.529, 0.529, 255 }
local power_color = { 1, 0.871, 0.239, 255 }


local debug_x = 0
local debug_y = 0
local poli_cost = 5
local power = poli_cost * 20
local num_polis = 0
local power_per_second = 0

local power_for_neighbours = { 1, 2, 4, 6, 10 }

local second = 1

-- Create a array for if the grid is occupied
grid = {}
for x = 0, cells_x do
    grid[x] = {}
    for y = 0, cells_y do
        grid[x][y] = false
    end
end

-- Pul poli in cell
function put_poli( x, y )
    love.graphics.draw( poli, x*cell_width, y*cell_width, 0, poli_scale, poli_scale )
end

-- Put a poli in all cells in the grid that are true
function put_polis()
    for x = 0, cells_x do
        for y = 0, cells_y do
            if grid[x][y] then
                put_poli( x, y )
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


function calculate_power_from_polis()
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
    put_polis()
    delta = love.timer.getDelta( )
    love.graphics.print("Power: " .. power, 0, grid_size_y)
    love.graphics.print("Power Per Second: " .. power_per_second, 0, grid_size_y + 16)
    love.graphics.print("Delta: " .. delta, 0, grid_size_y + 32)
end

function game_tick()
    power_this_tick = calculate_power_from_polis()
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