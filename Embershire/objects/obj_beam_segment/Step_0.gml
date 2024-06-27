// Step Event of obj_beam_segment
// Move the beam segment
x += lengthdir_x(speed, direction);
y += lengthdir_y(speed, direction);

// Progress the animation frame
image_index = animation_index;
animation_index += 0.1; // Adjust this value to control the animation speed

// If the animation has reached the end, destroy the segment
if (animation_index >= image_number) {
    instance_destroy();
}
