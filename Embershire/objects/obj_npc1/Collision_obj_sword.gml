if (!quest_given) {
    talking = true;
    show_debug_message("Hello, brave adventurer! I have a quest for you. Slay the dragon in the cave.");
    quest_given = true;
} else if (quest_given && !global.quest_completed) {
    show_debug_message("You haven't completed the quest yet! Slay the dragon in the cave.");
} else if (global.quest_completed) {
    show_debug_message("THANKS");
}

// Destroy the sword instance after collision
with (other) {
    instance_destroy();
}
	