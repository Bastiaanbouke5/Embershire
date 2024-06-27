// Collision Event of obj_player with obj_beam_segment
hp -= 2; // Reduce player health by 10 points
if (hp <= 0) {
    instance_destroy(); // Destroy player instance if health is 0 or less
    // Optional: Trigger game over logic or other effects
}
