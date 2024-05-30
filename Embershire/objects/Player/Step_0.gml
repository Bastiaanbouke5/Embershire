// Step Event
var move_x = 0;
var move_y = 0;

// Decrease the move cooldown timer
if (move_cooldown > 0) {
    move_cooldown--;
}

// Check for input and set movement and direction if cooldown is zero
if (move_cooldown == 0) {
    if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
        move_y = -grid_size;
        direction = 1; // Up
        move_cooldown = move_speed;
    } else if (keyboard_check(vk_down) || keyboard_check(ord("S"))) {
        move_y = grid_size;
        direction = 3; // Down
        move_cooldown = move_speed;
    } else if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
        move_x = -grid_size;
        direction = 2; // Left
        move_cooldown = move_speed;
    } else if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
        move_x = grid_size;
        direction = 0; // Right
        move_cooldown = move_speed;
	}
}

// Move the player based on move_speed
x += move_x;
y += move_y;

sprite_index = sPlayer_strip4;
image_index = direction;
image_speed = 0;