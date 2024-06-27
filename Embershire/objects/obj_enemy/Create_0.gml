// Create Event of obj_enemy
hp = 10; // Enemy health
armor = 2; // Enemy armor

is_hurt = false; // Flag to indicate hurt state
hurt_timer = 0; // Timer for hurt duration
HURT_DURATION = 30; // Duration of hurt state in frames (e.g., 30 frames)

image_speed = 0; // Stop automatic animation
image_index = 0; // Set to normal frame

grid_size = 16; // Grid size for movement
move_direction = irandom(3); // Initial movement direction (0 = right, 1 = down, 2 = left, 3 = up)
change_direction_timer = 1; // Timer to change direction periodically
move_timer = 60; // Cooldown timer for movement

beam_fire_timer = 0;
charge_timer = 120; 
beam_duration = 180; 
global.beam_segments = []; // Changed to global variable
cooldown_timer = 300;
beam_phase = "idle";
