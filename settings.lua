-- Size Settings
local grid_size_x = 640
local grid_size_y = 640
local cell_width = 64
local cells_x = grid_size_x / cell_width
local cells_y = grid_size_y / cell_width
local poli_size = 1856
local poli_scale = cell_width / poli_size

-- Colors
local bg_color = { 0.169, 0.114, 0.227, 255 }
local line_color = { 0.529, 0.529, 0.529, 255 }
local power_color = { 1, 0.871, 0.239, 255 }

-- Debug Varibles
local debug_x = 0
local debug_y = 0

-- Gameplay Settings
local poli_cost = 5
local power = poli_cost * 20
local num_polis = 0
local power_per_second = 0

local power_for_neighbours = { 1, 2, 4, 6, 10 }

local second = 1