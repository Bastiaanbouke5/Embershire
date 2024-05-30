/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 65DD5410
/// @DnDArgument : "key" "vk_up"
var l65DD5410_0;
l65DD5410_0 = keyboard_check(vk_up);
if (l65DD5410_0)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 1DD8A7A9
	/// @DnDParent : 65DD5410
	/// @DnDArgument : "speed" "-1"
	/// @DnDArgument : "type" "2"
	vspeed = -1;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 55C03489
/// @DnDArgument : "key" "vk_down"
var l55C03489_0;
l55C03489_0 = keyboard_check(vk_down);
if (l55C03489_0)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 20E01FEB
	/// @DnDParent : 55C03489
	/// @DnDArgument : "speed" "1"
	/// @DnDArgument : "type" "2"
	vspeed = 1;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 4C353B3F
/// @DnDArgument : "key" "vk_left"
var l4C353B3F_0;
l4C353B3F_0 = keyboard_check(vk_left);
if (l4C353B3F_0)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 0D5DF9B3
	/// @DnDParent : 4C353B3F
	/// @DnDArgument : "speed" "-1"
	/// @DnDArgument : "type" "1"
	hspeed = -1;
}

/// @DnDAction : YoYo Games.Mouse & Keyboard.If_Key_Down
/// @DnDVersion : 1
/// @DnDHash : 3D7D7304
/// @DnDArgument : "key" "vk_right"
var l3D7D7304_0;
l3D7D7304_0 = keyboard_check(vk_right);
if (l3D7D7304_0)
{
	/// @DnDAction : YoYo Games.Movement.Set_Speed
	/// @DnDVersion : 1
	/// @DnDHash : 24C71A04
	/// @DnDParent : 3D7D7304
	/// @DnDArgument : "speed" "1"
	/// @DnDArgument : "type" "1"
	hspeed = 1;
}