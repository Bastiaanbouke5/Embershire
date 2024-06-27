// Step Event of obj_enemy
if (is_hurt) {
    hurt_timer -= 1;

    if (hurt_timer <= 0) {
        is_hurt = false;
        image_index = 0; // Set normal frame
    }
} else {
    // Decrease the move timer
    move_timer -= 1;

    // Move enemy in steps of grid_size if the move timer is zero
    if (move_timer <= 0 && x mod grid_size == 0 && y mod grid_size == 0) {
        // Change direction periodically
        change_direction_timer -= 1;
        if (change_direction_timer <= 0) {
            move_direction = irandom(3);
            change_direction_timer = 60;
        }

        // Attempt to move in the current direction
        var new_x = x;
        var new_y = y;

        if (move_direction == 0) new_x += grid_size; // Move right
        else if (move_direction == 1) new_y += grid_size; // Move down
        else if (move_direction == 2) new_x -= grid_size; // Move left
        else if (move_direction == 3) new_y -= grid_size; // Move up

        // Check for collision at new position
        if (!place_meeting(new_x, new_y, Water_tileset)) {
            x = new_x;
            y = new_y;
        } else {
            // Change direction if collision detected
            move_direction = irandom(3);
        }

        // Reset the move timer after moving
        move_timer = 60;
    }
}

// Beam logic
switch (beam_phase) {
    case "idle":
        // If in idle phase, start charging after cooldown
        if (cooldown_timer > 0) {
            cooldown_timer -= 1;
        } else {
            beam_phase = "charging";
            charge_timer = 120; // Reset charge timer
        }
        break;
    
    case "charging":
        // If charging, decrement the charge timer
        if (charge_timer > 0) {
            charge_timer -= 1;
        } else {
            beam_phase = "firing";
            beam_fire_timer = 0; // Reset beam fire timer
        }
        break;

    case "firing":
        // Create beam segments and move them forward
        if (beam_duration > 0) {
            beam_fire_timer -= 1;

            // Create a new beam segment every 10 frames
            if (beam_fire_timer <= 0) {
                var beam_segment = instance_create_layer(x, y + 64, "Instances", obj_beam_segment);
                array_push(global.beam_segments, beam_segment); // Using array_push for GML array
                beam_fire_timer = 10; // Fire a new segment every 10 frames
            }

            // Array to hold indices of segments to delete
            var segments_to_delete = [];

            // Move existing beam segments
            for (var i = array_length(global.beam_segments) - 1; i >= 0; i--) {
                if (instance_exists(global.beam_segments[i])) {
                    global.beam_segments[i].y += 2; // Move segment down

                    // Destroy segment if it goes out of bounds
                    if (global.beam_segments[i].y > room_height) {
                        instance_destroy(global.beam_segments[i]);
                        array_push(segments_to_delete, i);
                    }
                } else {
                    array_push(segments_to_delete, i);
                }
            }

            // Delete segments that are marked for deletion
            for (var j = 0; j < array_length(segments_to_delete); j++) {
                array_delete(global.beam_segments, segments_to_delete[j], 1);
            }

            beam_duration -= 1;
        } else {
            // End of firing phase
            beam_phase = "cooldown";
            cooldown_timer = 300; // Reset cooldown timer
        }
        break;

    case "cooldown":
        // Cooldown phase before restarting the cycle
        if (cooldown_timer > 0) {
            cooldown_timer -= 1;
        } else {
            beam_phase = "idle";
        }
        break;
}
