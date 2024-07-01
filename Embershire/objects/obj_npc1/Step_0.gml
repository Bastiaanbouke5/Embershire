/// @description Insert description here
// You can write your code in this editor
if keyboard_check_pressed(ord("Z")) and (distance_to_object(obj_player) < dialogDistance) {
if (!instance_exists(obj_dialog)) {
    instance_create_layer(x, y, "instances", obj_dialog);
}
myTextNum ++;
}
switch(myTextNum) {
    case 1:
        myText = "First npc text."
        break;
    case 2:
        myText = "Second npc text."
        break;
    case 3:
        myText = "Third npc text."
        break;
    case 4:
        instance_destroy(obj_dialog);
        myTextNum = 0;
        break;
}
if (distance_to_object(obj_player) > dialogDistance) {
    myTextNum = 0;
    if instance_exists(obj_dialog) {
        instance_destroy(obj_dialog);
    }
}