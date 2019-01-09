-- Size Settings
grid_size_x = 640
grid_size_y = 640
cell_width = 64
cells_x = grid_size_x / cell_width
cells_y = grid_size_y / cell_width
poli_size = 1856
poli_scale = cell_width / poli_size

-- Colors
bg_color = { 0.169, 0.114, 0.227, 255 }
line_color = { 0.529, 0.529, 0.529, 255 }
power_color = { 1, 0.871, 0.239, 255 }

-- Debug Varibles
debug_x = 0
debug_y = 0

-- Gameplay Settings
poli_cost = 10
council_cost = 100
power = poli_cost 
num_polis = 0
power_per_second = 0
power_for_neighbours = { 1, 2, 4, 6, 10 }
second = 1

-- Tile Constants
TILE_EMPTY = 0
TILE_POLI = 1
TILE_COUNCIL = 2