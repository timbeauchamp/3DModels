include <gears/gears.scad>

showPinion=false;
showPulley = false;
showKeyedBore = true;

 
gear_teeth=35;
pinion_teeth=11;
axis_angle=100;
tooth_width=5;
gear_bore=0;
pinion_bore=0;
pressure_angle = 20;
helix_angle=20;
gear_scale=2.26;

delta_gear = atan(sin(axis_angle)/(pinion_teeth/gear_teeth+cos(axis_angle)));   // Cone Angle of the Gear 
delta_pinion = atan(sin(axis_angle)/(gear_teeth/pinion_teeth+cos(axis_angle)));// Cone Angle of the Pinion


module myCutOut()
{
    for(a = [0, 90, 180, 270])
    {
        rotate([0,0,a])
        union()
        {
            translate([0,0,-2])
            {
                linear_extrude(height = 24, center = false, convexity = 10, twist = 0)
                polygon( points=[[7,2],[26,2],[20,15],[18,18],[15,20],[2,26],[2,7]]);
                cylinder(24, 2.5, 2.5);
            }
            {
                translate([16.5,2.05,15.5])
                rotate([90,0,0])
                linear_extrude(4.1)
                scale([1,.75,1])
                circle(9.5);
            }
        }
    }
}

if(showPulley)
difference()
{
    union()
   { 
    // pulley
    rotate_extrude($fn=200) 
    polygon( points=[[0,0],[40,0],[40,1],[35,6],[35,7],[40,12],[40,13],[0,13]] );

    // pulley Gear 
    translate([0,0,13])
    scale([gear_scale,gear_scale,gear_scale])
        bevel_gear(modul=1, tooth_number=35, partial_cone_angle=delta_gear, tooth_width=tooth_width, bore=gear_bore, pressure_angle = pressure_angle, helix_angle=helix_angle);
    } 
    myCutOut();
}

if(showPinion)
translate([60,0,00])
{
    // pinion
    translate([0,0,0])
    difference()
    { 
        scale([gear_scale,gear_scale,gear_scale])
        bevel_gear(modul=1, tooth_number=pinion_teeth, partial_cone_angle=delta_pinion, tooth_width=tooth_width, bore=pinion_bore, pressure_angle=pressure_angle, helix_angle=-helix_angle);
    translate([0,0,-1])
    cylinder(  12,    2.65,    2.65, $fa = 4, $fs = 0.01);
    }
}

if(showKeyedBore)
translate([45,-25,00])
{
    cylinderHeight = 10.887;
    keyHeight = 6;
    
    difference()
    {
    cylinder(  cylinderHeight, 7, 7, $fa = 4, $fs = 0.01);
    translate([0,0,-1])
    cylinder(  cylinderHeight + 2,    2.68,    2.68, $fa = 4, $fs = 0.01);
    }    
    
    translate([1.6,-2.5,cylinderHeight - keyHeight])
    cube([3,5,keyHeight]);
}



