// Collision Event with obj_sword
if (!is_hurt) {
    var sword = instance_place(x, y, obj_sword);
    if (sword != noone) {
        // Calculate effective damage
        var effectiveDamage = max(0, sword.swordDamage - max(0, armor - sword.swordArmorPierce));
		show_debug_message("Effective Damage: " + string(effectiveDamage));
        // Apply damage to enemy
        hp -= effectiveDamage;

        // Check if the enemy is dead
        if (hp <= 0) {
            instance_destroy();
        } else {
            // Set the hurt state
            is_hurt = true;
            hurt_timer = HURT_DURATION;
            image_index = 1; // Set hurt frame
        }

        // Destroy the sword instance
        with (sword) {
            instance_destroy();
        }
    }
}
