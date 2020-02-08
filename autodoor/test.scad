include <gears/gears.scad>

gear_teeth=35;
pinion_teeth=11;
axis_angle=100;
tooth_width=5;
gear_bore=0;
pinion_bore=0;
pressure_angle = 20;
helix_angle=20;
gear_scale=2.26;


delta_pinion = atan(sin(axis_angle)/(gear_teeth/pinion_teeth+cos(axis_angle)));// Cone Angle of the Pinion

translate([0,0,20.6]) 
rotate([180,0,0])
union()
{
    difference()
    {
        cylinder(  8.6, 5, 5, $fa = 4, $fs = 0.01);  // .1 higher that needed
        translate([0,0,-0.1])
        difference()
        {
            cylinder(  10 + 2, 2.9, 2.9, $fa = 4, $fs = 0.01);
            union()
            {
                translate([-2.5,1.98,-0.1])
                cube([5,2,12]);
                translate([-2.5,-3.98,-0.1])
                cube([5,2,12]);
            }
        }       
    }

    translate([0,0,8.61])
    {
        cylinderHeight = 10.887;
        keyHeight = 6;

        // pinion
        translate([0,0,0])
        difference()
        { 
            scale([gear_scale,gear_scale,gear_scale])
            bevel_gear(modul=1, tooth_number=pinion_teeth, partial_cone_angle=delta_pinion, tooth_width=tooth_width, bore=pinion_bore, pressure_angle=pressure_angle, helix_angle=-helix_angle);
            translate([0,0,-1])
            union()
            {
                cylinder(  cylinderHeight + 2, 2.5, 2.5, $fa = 4, $fs = 0.01);
            }
        }
        translate([0,0,10.8]) 
        difference()
        {
            cylinder(  1.15, 7, 5, $fa = 4, $fs = 0.01);
            translate([0,0,-.1]) 
            cylinder(  1.3, 3,3, $fa = 4, $fs = 0.01);        
        }
    }
}