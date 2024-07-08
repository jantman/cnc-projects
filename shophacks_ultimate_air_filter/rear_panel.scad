// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;
$fn = 360;

thickness = 0.25;
union() {
    difference() {
        cube([27, 24.75, thickness]);
        translate([2.375, 1.25, -0.1]) {
            roundedcube(size = [22.25, 17.25, 1], center = false, radius = 1.5, apply_to = "zmin");
        }
        // left side slots, bottom to top
        translate([1, 2.375, 0]) { slot(); }
        translate([1, 10.375, 0]) { slot(); }
        translate([1, 18.375, 0]) { slot(); }
        // right side slots, bottom to top
        translate([26, 2.375, 0]) { slot(); }
        translate([26, 10.375, 0]) { slot(); }
        translate([26, 18.375, 0]) { slot(); }
    }
    // bottom tabs, left to right
    translate([4 + 3.5, 0, 0]) { rotate([0, 0, 90]) { tab(); }}
    translate([4 + 11.5, 0, 0]) { rotate([0, 0, 90]) { tab(); }}
    translate([4 + 19.5, 0, 0]) { rotate([0, 0, 90]) { tab(); }}
    // top tabs, left to right
    translate([3.5, 24.75, 0]) { rotate([0, 0, -90]) { tab(); }}
    translate([11.5, 24.75, 0]) { rotate([0, 0, -90]) { tab(); }}
    translate([19.5, 24.75, 0]) { rotate([0, 0, -90]) { tab(); }}
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

module tab() {
    twidth = 4;
    tdepth = 1.125;
    tradius = 1.125/3.0;
    translate([0, 0, -0.5]) {
        intersection() {
            translate([-1 * tdepth, 0, 0]) {
                roundedcube(size = [tdepth * 2, twidth, 1], radius = tradius, apply_to = "zmin");
            }
            translate([-1 * tdepth, 0, 0.5]) {
                cube([tdepth, twidth, thickness]);
            }
        }
    }
}
