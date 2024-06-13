// Create Event of obj_sword
swordDamage = 4;
swordAttackSpeed = 4; // attacks per second
swordArmorPierce = 2;
swordSwingSpeed = 6; // how fast the sword swings
swordWidth = 12;
swordLength = 32;
swordCooldown = 0;

// Initialize sword properties
image_speed = swordSwingSpeed / 60; // Convert speed to a suitable frame rate
alarm[0] = 50 / swordAttackSpeed; // Cooldown before the sword can attack again

// Direction of the slash (1 = right, -1 = left)
slashDirection = -1;
