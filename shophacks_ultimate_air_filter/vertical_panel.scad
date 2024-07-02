// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;
$fn = 360;

thickness = 0.25;
union() {
    difference() {
        cube([26, 21.25, thickness]);
        translate([2.375, 1.625, -0.1]) {
            roundedcube(size = [21.25, 17.25, 1], center = false, radius = 1.25, apply_to = "zmin");
        }
        // left side slots, bottom to top
        translate([1, 3.25, 0]) { slot(); }
        translate([1, 13.25, 0]) { slot(); }
        // top side slots, left to right
        translate([3.5, 20.25, 0]) { rotate([0, 0, -90]) { slot(); }}
        translate([11.5, 20.25, 0]) { rotate([0, 0, -90]) { slot(); }}
        translate([19.5, 20.25, 0]) { rotate([0, 0, -90]) { slot(); }}
        // right side slots, botton to top
        translate([25, 3.25, thickness]) { rotate([0, 180, 0]) { slot(); }}
        translate([25, 13.25, thickness]) { rotate([0, 180, 0]) { slot(); }}
    }
}

module slot() {
    slength = 4;
    swidth = 9.0 / 32.0;
    translate([-1 * (swidth / 2.0), 0, -0.25]) {
        union() {
            cube([swidth, slength, 1]);
            translate([swidth / 2.0, 0, 0]) { cylinder(d=swidth, h=1); }
            translate([swidth / 2.0, slength, 0]) { cylinder(d=swidth, h=1); }
        }
    }
}
