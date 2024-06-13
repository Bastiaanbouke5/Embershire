// Create Event of obj_player
collisionMap = layer_tilemap_get_id(layer_get_id("Water_Tiles"));

hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
inCombat = false;

spriteRun = sPlayer_strip4;
spriteIdle = sPlayer_strip4;
localFrame = 0;


swordDamage = 4;
swordAttackSpeed = 4; // attacks per second
swordArmorPierce = 2;
swordSwingSpeed = 6; // how fast the sword swings
swordWidth = 12;
swordLength = 32;
swordCooldown = 0;
