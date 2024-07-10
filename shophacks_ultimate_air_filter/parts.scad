use <my_roundedcube.scad>;

// workaround for FreeCAD always importing OpenSCAD as mm units, https://github.com/FreeCAD/FreeCAD/issues/15304
// if we want actual inches, just change this to return x unmodified
function inch(x) = x * 25.4;

module front_panel() {
    include <variables.scad>;
    translate([0, 0, -1 * front_thickness]) { // set the top face of the part to Z=0 for easier CAM
        difference() {
            my_roundedcube(front_x, front_y, front_thickness, inch(1));
            // center hole
            translate([front_x / 2, front_y / 2, inch(-5)]) { cylinder(d=front_hole_diam, h=inch(10)); }
            // bottom through slot
            translate([inch(-1), slot_inset, front_thickness - slot_depth]) {
                cube([inch(29), slot_width, slot_depth + 1]);
            }
            // top through slot
            translate([inch(-1), front_y - (slot_inset + slot_width), front_thickness - slot_depth]) {
                cube([inch(29), slot_width, slot_depth + 1]);
            }
            // left stopped slot
            translate([slot_inset, slot_inset + slot_width - 0.1, front_thickness - slot_depth]) {
                cube([slot_width, inch(24 + (21.0 / 32.0) + 0.05), slot_depth + 1]);
            }
            // right stopped slot
            translate([front_x - (slot_inset + slot_width), slot_inset + slot_width - 0.1, front_thickness - slot_depth]) {
                cube([slot_width, inch(24 + (21.0 / 32.0) + 0.05), slot_depth + 1]);
            }
        }
    }
}

module tab(thickness) {
    include <variables.scad>;
    translate([0, 0, inch(-0.5)]) {
        intersection() {
            translate([-1 * tdepth, 0, 0]) {
                my_roundedcube(tdepth * 2, twidth, inch(1), tradius);
            }
            translate([-1 * tdepth, 0, inch(0.5)]) {
                cube([tdepth, twidth, thickness]);
            }
        }
    }
}

module horizontal_panel() {
    include <variables.scad>;
    translate([0, 0, -1 * thickness]) { // set the top face of the part to Z=0 for easier CAM
        union() {
            difference() {
                cube([horiz_x, horiz_y, thickness]);
                translate([inch(1.25), inch(1.625), inch(-0.1)]) {
                    my_roundedcube(inch(22.25), inch(17.25), inch(1), inch(1.25));
                }
            }
            // left side tabs, bottom to top
            translate([0, inch(3.25), 0]) { tab(thickness); }
            translate([0, inch(13.25), 0]) { tab(thickness); }
            // top side tabs, left to right
            translate([inch(2.375), horiz_y, 0]) { rotate([0, 0, -90]) { tab(thickness); }}
            translate([inch(10.375), horiz_y, 0]) { rotate([0, 0, -90]) { tab(thickness); }}
            translate([inch(18.375), horiz_y, 0]) { rotate([0, 0, -90]) { tab(thickness); }}
            // right side tabs, botton to top
            translate([horiz_x, inch(3.25), thickness]) { rotate([0, 180, 0]) { tab(thickness); }}
            translate([horiz_x, inch(13.25), thickness]) { rotate([0, 180, 0]) { tab(thickness); }}
        }
    }
}

module slot(thickness) {
    slength = inch(4);
    swidth = inch(9.0 / 32.0);
    translate([-1 * (swidth / 2.0), 0, -1 * thickness]) {
        union() {
            cube([swidth, slength, thickness * 4]);
            translate([swidth / 2.0, 0, 0]) { cylinder(d=swidth, h=thickness * 4); }
            translate([swidth / 2.0, slength, 0]) { cylinder(d=swidth, h=thickness * 4); }
        }
    }
}

module vertical_panel() {
    include <variables.scad>;
    translate([0, 0, -1 * thickness]) { // set the top face of the part to Z=0 for easier CAM
        union() {
            difference() {
                cube([vert_x, vert_y, thickness]);
                translate([inch(2.375), inch(1.625), inch(-0.1)]) {
                    my_roundedcube(inch(21.25), inch(17.25), inch(1), inch(1.25));
                }
                // left side slots, bottom to top
                translate([inch(1), inch(3.25), 0]) { slot(thickness); }
                translate([inch(1), inch(13.25), 0]) { slot(thickness); }
                // top side slots, left to right
                translate([inch(3.5), inch(20.25), 0]) { rotate([0, 0, -90]) { slot(thickness); }}
                translate([inch(11.5), inch(20.25), 0]) { rotate([0, 0, -90]) { slot(thickness); }}
                translate([inch(19.5), inch(20.25), 0]) { rotate([0, 0, -90]) { slot(thickness); }}
                // right side slots, bottom to top
                translate([inch(26), inch(3.25), thickness]) { rotate([0, 180, 0]) { slot(thickness); }}
                translate([inch(26), inch(13.25), thickness]) { rotate([0, 180, 0]) { slot(thickness); }}
            }
        }
    }
}

module rear_panel() {
    include <variables.scad>;
    translate([0, 0, -1 * thickness]) { // set the top face of the part to Z=0 for easier CAM
        union() {
            difference() {
                cube([inch(27), inch(24.75), thickness]);
                translate([inch(2.375), inch(1.25), inch(-0.1)]) {
                    my_roundedcube(inch(22.25), inch(17.25), inch(1), inch(1.5));
                }
                // left side slots, bottom to top
                translate([inch(1), inch(2.375), 0]) { slot(thickness); }
                translate([inch(1), inch(10.375), 0]) { slot(thickness); }
                translate([inch(1), inch(18.375), 0]) { slot(thickness); }
                // right side slots, bottom to top
                translate([inch(26), inch(2.375), 0]) { slot(thickness); }
                translate([inch(26), inch(10.375), 0]) { slot(thickness); }
                translate([inch(26), inch(18.375), 0]) { slot(thickness); }
            }
            // bottom tabs, left to right
            translate([inch(4 + 3.5), 0, 0]) { rotate([0, 0, 90]) { tab(thickness); }}
            translate([inch(4 + 11.5), 0, 0]) { rotate([0, 0, 90]) { tab(thickness); }}
            translate([inch(4 + 19.5), 0, 0]) { rotate([0, 0, 90]) { tab(thickness); }}
            // top tabs, left to right
            translate([inch(3.5), inch(24.75), 0]) { rotate([0, 0, -90]) { tab(thickness); }}
            translate([inch(11.5), inch(24.75), 0]) { rotate([0, 0, -90]) { tab(thickness); }}
            translate([inch(19.5), inch(24.75), 0]) { rotate([0, 0, -90]) { tab(thickness); }}
        }
    }
}
