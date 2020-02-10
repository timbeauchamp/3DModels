use <airlock.scad>
$fn=60;

bulbRadius = 9.4;
bulbSeparation = 12.75;
tubeRad = bulbRadius;

module LED(r=2.5, h=9.69)
{
    LEDRad = r;
    LEDLipRad = LEDRad + 0.45; 
    LEDHeight = h;
    LEDLip = 1;

    translate([0,0,-LEDRad/2 ])
    union()
    {
        translate([0,0,-(LEDHeight - LEDRad - LEDLip)/2])
            cylinder(LEDLip,r=LEDLipRad, center=true);
        cylinder((LEDHeight-LEDRad),r=LEDRad, center=true);
        translate([0,0,(LEDHeight-LEDRad)/2])
            sphere(r=LEDRad);
    
    }
}

//translate([0,0,-11])
translate([32,0,0])
difference()
{
    union()
    {
        
        cube([31,14,10], center = true);
        translate([0,0,-4])
        {
            cube([40,40,2], center = true);
            cube([20,80,2], center = true);
        }
        translate([19,0,6])
        {
            cube([2,40,20], center = true);
        }
        translate([-19,0,6])
        {
            cube([2,40,20], center = true);
        }
        translate([0,39,6])
        {
            cube([20,2,20], center = true);
        }
    }
    translate([0,0,2])
    union()
    {
        cube([20,30,10], center = true);
        cube([28.6,10.1,10], center = true);        
        translate([0,7,0])
            cube([35,15,7], center = true);   
        translate([0,39,7])
            rotate([90,0,0])
                cylinder(4,r=5.25,center=true);     
    }
}
*
rotate([90,0,0])
difference()
{
    union()
    {
        cube([3,10,30], center = true);
        cube([28.5,10,10], center = true);
    }
    union()
    {
        translate([0,1,0])
        union()    //LEDs
        {
            LEDHeight = 9.69;
            LEDRad = 2.62;
            lightChannelRad  =  LEDRad *.85;
            separation = bulbRadius * 1.0;
        

            translate([-(LEDHeight+ separation)/2,0,0])
                rotate([0,90,0])
                    LED(h=LEDHeight, r=LEDRad);

            translate([(LEDHeight+ separation)/2,0,0])
                rotate([0,-90,0])
                    LED(h=LEDHeight, r=LEDRad);
            rotate([0,90,0])
                cylinder(separation + LEDHeight,r=lightChannelRad, center=true);
        }

        translate([0,tubeRad - 1,0])    // Tube
        rotate([0,0,-90])
        airlock(bulbRadius, bulbSeparation);
    }
}