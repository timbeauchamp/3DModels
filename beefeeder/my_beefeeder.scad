$fn=160;


outer = 86.5;
inner = 82;
tall = 16.75;
length = 120;
width = 100;
depth = 13;
box_opening=9;

translate([50,0,0])
//rotate([0,90,0])

translate([0,-width/2, 0])
union()
{
    difference()
    {
        union()
        {
            cube([depth, width, length]);
            cube([depth, 69, length+20]);
        }
        union()
        {
            translate([2,2,2])
                cube([depth-4,width-4, length+40]);

            translate([-5,-1,length])
                cube([depth-4,width-4, 42]);

            translate([0,width/2,5+(outer+4)/2])
            rotate([0,90,0])
                cylinder(tall+2,d=(outer+5), center=true);
        
        }
    }

    translate([7,0, 100])
    rotate([-90,0,0])
    linear_extrude(width)
        polygon([[6,0],[6,6],[0,0]]);

    translate([7,20, 0])
    cube([6, 2, 80]);

    translate([7,80, 0])
    cube([6, 2, 80]);

}

translate([0,0,(tall+2)/2])
difference()
{
    cylinder(tall+2,d=outer+4, center=true);
    union()
    {
        translate([0,0,2])
            cylinder(tall+2,d=outer, center=true);
    
        for(a=[0:30:360])
        {
            rotate([0,0,a])
            {
                translate([15,0,-1])
                    cylinder(tall+2,d=2, center=true);
                translate([30,0,-1])
                    cylinder(tall+2,d=2, center=true);

            }
        }
    }
}

