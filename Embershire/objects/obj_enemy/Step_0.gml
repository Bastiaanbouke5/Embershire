// Step Event of obj_enemy
if (is_hurt) {
    hurt_timer -= 1;

    if (hurt_timer <= 0) {
        is_hurt = false;
        image_index = 0; // Set normal frame
    }
}
