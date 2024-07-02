// from: https://danielupshaw.com/openscad-rounded-corners/
use <roundedcube.scad>;

thickness = 0.25;
union() {
    difference() {
        cube([24.75, 20.125, thickness]);
        translate([1.25, 1.625, -0.1]) {
            roundedcube(size = [22.25, 17.25, 1], center = false, radius = 1.25, apply_to = "zmin");
        }
    }
    // left side tabs, bottom to top
    translate([0, 3.25, 0]) { tab(); }
    translate([0, 13.25, 0]) { tab(); }
    // top side tabs, left to right
    translate([2.375, 20.125, 0]) { rotate([0, 0, -90]) { tab(); }}
    translate([10.375, 20.125, 0]) { rotate([0, 0, -90]) { tab(); }}
    translate([18.375, 20.125, 0]) { rotate([0, 0, -90]) { tab(); }}
    // right side tabs, botton to top
    translate([24.75, 3.25, thickness]) { rotate([0, 180, 0]) { tab(); }}
    translate([24.75, 13.25, thickness]) { rotate([0, 180, 0]) { tab(); }}
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
