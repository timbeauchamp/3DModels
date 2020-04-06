$fn=100;

threaddepth = 2.5;
pitch = 5.625;
lidID = 87.25;




difference()
{
    cylinder(18,d=lidID+4);
    union()
    {
        translate([0,0,1])
            cylinder(18,d=lidID);
        
        for(a=[0:30:360])
        {
            rotate([0,0,a])
            {
                translate([15,0,-1])
                    cylinder(18+2,d=2, center=true);
                translate([30,0,-1])
                    cylinder(18+2,d=2, center=true);

            }
        }
    }
}


pitchangle = atan(pitch / (lidID*PI));

translate([0,0,9])
for(a=[0:1:360])
{
    translate([0,0,pitch*a/360])
    rotate([pitchangle,0,a])
    rotate_extrude(angle=1, convexity = 10, $fn = 100)
    translate([lidID/2, 0, 0])
    scale([1,.5,1])
    difference()
    {   
        circle(r = threaddepth, $fn = 100);
        translate([threaddepth/1.5,0,0])
        square([threaddepth,2*threaddepth], center=true);
    }
}

