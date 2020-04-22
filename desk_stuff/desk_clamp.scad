$fn=60;
width=8; // Thickness of desk
height = 30;  // left to  right
length = 40; // how deep
thickness = 2;
difference()
{
    cube([length,width + thickness *2,height]);
    translate([-thickness,thickness,-1])
    cube([length,width,height+2]);
}    

cube([thickness,thickness *2,height]);

translate([44,width/2 + thickness ,0])
difference()
{
    cylinder(3, d=10 + thickness *2);
    translate([0,0,-1])
    {
        cylinder(4.5, d=10);
                translate([0,width/2,0])
        cube([.4,4,4.5]);
    }
}

