
//include <../../MCAD/gears.scad>
use <../../MCAD/involute_gears.scad>

defaultThickness = 4;

$fn=50;

module myGear(teeth=100, thickness = 4)
{
    difference()
    {
                gear(teeth,circular_pitch=180,
                        gear_thickness = thickness - 2,
                        rim_thickness = thickness, 
                        hub_thickness = thickness,
                        hub_diameter=3,
                        bore_diameter=3.7,
                        circles=6);
  
    }
}    

module myGearSet(bottom=30, bottomThickness = 4, top = 10, topThickness=4, flip=false)
{
    flipAngle = flip ? 180 : 0;
    flipTrans = flip ? bottomThickness + topThickness : 0;

    translate([0,0,flipTrans])
    rotate([flipAngle,0,])
    union()
    {
        myGear(bottom, bottomThickness);
        translate([0,0,bottomThickness])
            myGear(top, topThickness);
    }
}
    
myGearSet(15,defaultThickness,10,defaultThickness*2, flip=false);
translate([34,0,0])
    myGearSet(45,defaultThickness,12,defaultThickness);   //  3:1

translate([85,0,0])
    myGearSet(48,defaultThickness,10,defaultThickness*2);   //  4:1

