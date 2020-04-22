$fn=60;
width=17.8; // Thickness of wood
height = 30;  // left to  right
length = 40; // how deep
thickness = 2;
difference()
{
    cube([length,width + thickness *2,height]);
    translate([-thickness,thickness,-1])
    cube([length,width,height+2]);
}    


translate([46,width/2 + thickness ,height/2])
rotate([0,-90,0])
cylinder(8, d=3.5);

#translate([46,width/2 + thickness ,height/2])
rotate([0,-90,0])
cylinder(2.5, d=6.75);

cube([thickness,thickness *2,height]);
