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

module airlock(bulbRad, bulbSeparation, buffer=.5)
{
    union()
    {
        cylinder(60,r=bulbRad/2, center=true);
        sphere(r=bulbRad + buffer);
        translate([0,0,bulbSeparation])
            sphere(r=bulbRad + buffer);
    }
}

rotate([90,0,0])
difference()
{
    union()
    {
        cube([3,10,50], center = true);
        cube([28.5,10,10], center = true);
    }
    union()
    {
        union()    //LEDs
        {
            LEDHeight = 9.69;
            LEDRad = 2.62;
            separation = bulbRadius * 1.0;
        

            translate([-(LEDHeight+ separation)/2,0,0])
                rotate([0,90,0])
                    LED(h=LEDHeight, r=LEDRad);

            translate([(LEDHeight+ separation)/2,0,0])
                rotate([0,-90,0])
                    LED(h=LEDHeight, r=LEDRad);
        }

        translate([0,tubeRad - 1,0])    // Tube
        airlock(bulbRadius, bulbSeparation);
    }
}