difference()
{
    union()
    {
        cube([73,54,2]);
        translate([(73-25.2)/2,0,0])
            cube([25,6.5,13]);
        translate([0,52,0])
            cube([73,2,25]);
        
    }
    translate([13,13,-1])
        cube([44 +.3,25 +.3,4]);
    translate([(73-25.4)/2,0,6.45])
        rotate([0,90,0])
            cylinder(25.4, r=4.45);
}

