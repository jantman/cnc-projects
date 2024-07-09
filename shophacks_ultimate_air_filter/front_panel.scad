use <my_roundedcube.scad>;
$fn = 360;

// workaround for FreeCAD always importing OpenSCAD as mm units, https://github.com/FreeCAD/FreeCAD/issues/15304
// if we want actual inches, just change this to return x unmodified
function inch(x) = x * 25.4;

thickness = inch(0.758);
slot_inset = inch(13.0 / 16.0); // 0.8125
slot_width = inch(11.0 / 32.0); // 0.34375
slot_depth = inch(0.375);
translate([0, 0, -1 * thickness]) { // set the top face of the part to Z=0 for easier CAM
    difference() {
        my_roundedcube(inch(27), inch(27), thickness, inch(1));
        // center hole
        translate([inch(27.0 / 2.0), inch(27.0 / 2.0), inch(-5)]) { cylinder(d=inch(21.675), h=inch(10)); }
        // bottom through slot
        translate([inch(-1), slot_inset, thickness - slot_depth]) {
            cube([inch(29), slot_width, slot_depth + 1]);
        }
        // top through slot
        translate([inch(-1), inch(27) - (slot_inset + slot_width), thickness - slot_depth]) {
            cube([inch(29), slot_width, slot_depth + 1]);
        }
        // left stopped slot
        translate([slot_inset, slot_inset + slot_width - 0.1, thickness - slot_depth]) {
            cube([slot_width, inch(24 + (21.0 / 32.0) + 0.05), slot_depth + 1]);
        }
        // right stopped slot
        translate([inch(27) - (slot_inset + slot_width), slot_inset + slot_width - 0.1, thickness - slot_depth]) {
            cube([slot_width, inch(24 + (21.0 / 32.0) + 0.05), slot_depth + 1]);
        }
    }
}