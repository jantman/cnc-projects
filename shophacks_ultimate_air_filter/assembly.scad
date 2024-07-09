use <parts.scad>;
include <variables.scad>;
$fn = 360;

rotate([90, 0, 0]) {
    color("blue") { front_panel(); }
}


// !!!! these are really horizontal not vertical
translate([slot_inset + thickness + ((slot_width - thickness) / 2), slot_depth, tdepth]) {
    rotate([180, -90, 0]) {
        color("green") { horizontal_panel(); }
    }
}
translate([(front_x - (slot_inset + slot_width)) + thickness + ((slot_width - thickness) / 2), slot_depth, tdepth]) {
    rotate([180, -90, 0]) {
        color("green") { horizontal_panel(); }
    }
}

// !!! these are really vertical not horizontal
translate([slot_width / 2, slot_depth, slot_inset]) {
    rotate([180, 0, 0]) {
        color("red") { vertical_panel(); }
    }
}
translate([slot_width / 2, slot_depth, slot_inset + inch(24.75) + thickness]) {
    rotate([180, 0, 0]) {
        color("red") { vertical_panel(); }
    }
}

translate([0, -1 * horiz_y, tdepth]) {
    rotate([90, 0, 0]) {
        rear_panel();
    }
}
