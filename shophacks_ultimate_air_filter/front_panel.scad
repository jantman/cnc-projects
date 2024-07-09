use <my_roundedcube.scad>;
$fn = 360;

thickness = 0.758;
slot_inset = 13.0 / 16.0; // 0.8125
slot_width = 11.0 / 32.0; // 0.34375
slot_depth = 0.375;
difference() {
    my_roundedcube(27, 27, thickness, 1);
    translate([27.0 / 2.0, 27.0 / 2.0, -5]) { cylinder(d=21.675, h=10); }
    // bottom through slot
    translate([-1, slot_inset, thickness - slot_depth]) {
        cube([29, slot_width, slot_depth]);
    }
    // top through slot
    translate([-1, 27 - (slot_inset + slot_width), thickness - slot_depth]) {
        cube([29, slot_width, slot_depth]);
    }
    // left stopped slot
    translate([slot_inset, slot_inset + slot_width, thickness - slot_depth]) {
        cube([slot_width, 24 + (21.0 / 32.0) + 0.05, slot_depth]);
    }
    // right stopped slot
    translate([27 - (slot_inset + slot_width), slot_inset + slot_width, thickness - slot_depth]) {
        cube([slot_width, 24 + (21.0 / 32.0) + 0.05, slot_depth]);
    }
}
