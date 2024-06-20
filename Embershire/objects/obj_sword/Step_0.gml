// Step Event of obj_sword

// Move the sword in the direction of the slash
if(Player.direction == 90 || Player.direction == 270){
	x += slashDirection * swordSwingSpeed;	
}else{
	y += slashDirection * swordSwingSpeed;	
}

// Check if the sword should be destroyed (end of swing)
if (alarm[0] <= 0) {
    instance_destroy();
}
