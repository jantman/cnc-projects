module my_roundedcube(x, y, t, r) {
    $fn = 50;
    translate([r, r, 0]) {
        minkowski() {
            cube([x - (r * 2), y - (r * 2), t / 2]);
            cylinder(r=r, h=t/2);
        }
    }
}