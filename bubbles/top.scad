difference()
{
    cube([66,44,6], center=true);
    union()
    {   
        translate([0,0,2])
            cube([62,40,6], center=true);
        cylinder(8, d=25, center=true);
    }
}