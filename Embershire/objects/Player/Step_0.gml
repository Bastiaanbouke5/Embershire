
function FreeWalk(){
	keyLeft = keyboard_check(vk_left)|| keyboard_check(ord("A"));
	keyRight =  keyboard_check(vk_right)|| keyboard_check(ord("D"));
	keyUp =  keyboard_check(vk_up)|| keyboard_check(ord("W"));
	keyDown =  keyboard_check(vk_down)|| keyboard_check(ord("S"));

	inputDirection = point_direction(0,0,keyRight-keyLeft,keyDown-keyUp);
	inputMagnitude = (keyRight - keyLeft != 0) || (keyDown - keyUp != 0);

	//Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision()

	//Update Sprite Index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	} else sprite_index = spriteIdle;
	if (_oldSprite != sprite_index) localFrame = 0;

	//Update Image Index
}

function TileWalk(){
    if (keyboard_check_pressed(vk_left) || keyboard_check_pressed(ord("A"))) {
        hSpeed = -TILE_SIZE;
        vSpeed = 0;
    } else if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(ord("D"))) {
        hSpeed = TILE_SIZE;
        vSpeed = 0;
    } else if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"))) {
        hSpeed = 0;
        vSpeed = -TILE_SIZE;
    } else if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"))) {
        hSpeed = 0;
        vSpeed = TILE_SIZE;
    } else {
        hSpeed = 0;
        vSpeed = 0;
    }

    x += hSpeed;
    y += vSpeed;
}

function alignToGrid() {
    // Calculate excess
    var excessX = x mod 32;
    var excessY = y mod 32;

    // Adjust position
    x -= excessX;
    y -= excessY;
    
    // Handle excess (negative or positive)
    if (excessX >= 16) {
        x += 32;
    }
    if (excessY >= 16) {
        y += 32;
    }
}

// Step Event of obj_player

// Handle sword attack
if (keyboard_check_pressed(vk_space) && swordCooldown <= 0) {
    var sword = instance_create_layer(x, y, "Instances", obj_sword);
    
    // Pass the sword properties to the new sword instance
    sword.swordDamage = swordDamage;
    sword.swordAttackSpeed = swordAttackSpeed;
    sword.swordArmorPierce = swordArmorPierce;
    sword.swordSwingSpeed = swordSwingSpeed;
    sword.swordWidth = swordWidth;
    sword.swordLength = swordLength;

    // Determine the direction and position of the slash
    if (direction == 90) {
        // Up
        sword.x = x + 32;
        sword.y = y - 32;
        sword.slashDirection = -1;
    } else if (direction == 180) {
        // Left
        sword.x = x;
        sword.y = y + 32;
        sword.slashDirection = -1;
    } else if (direction == 270) {
        // Down
        sword.x = x - 32;
        sword.y = y;
        sword.slashDirection = 1;
    } else {
        // Right
        sword.x = x;
        sword.y = y - 32;
        sword.slashDirection = 1;
    }

    // Set cooldown
    swordCooldown = 60 / swordAttackSpeed;
}

// Reduce the sword cooldown
if (swordCooldown > 0) {
    swordCooldown--;
}



function GameLoop(){
	if(keyboard_check_pressed(ord("C")))
	{
		alignToGrid();
		inCombat = !inCombat;
	}
	if(inCombat == true)
	{
		TileWalk();
	}else{
		FreeWalk();
	}
	
	PlayerAnimateSprite();
	
}

function getGlobalCoordinates() {
    return {x: x, y: y};
}

	GameLoop();