if (quest_given && !global.quest_completed) {
    var view_x = view_xview[0]; // Get the x position of the viewport
    var view_y = view_yview[0]; // Get the y position of the viewport

    draw_text(view_x + 10, view_y + 10, "Quest: Slay the dragon in the forrest");
}
