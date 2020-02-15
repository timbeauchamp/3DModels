//  Airlock for Brewing
//  Tim Beauchamp

$fn=60;

bulbRadius = 9.4;
bulbSeparation = 12.75;
tubeRad = 4.5;

module trippleBulb(bulbRad, bulbSeparation, buffer=.5)
{
    union()
    {
//        cylinder(40,r=bulbRad/2, center=true);
        sphere(r=bulbRad + buffer);
        translate([0,0,bulbSeparation])
            sphere(r=bulbRad + buffer);
        translate([0,0,bulbSeparation*2])
            sphere(r=bulbRad + buffer);
    }
}

module airlock(bulbRad, bulbSeparation, buffer=.5)
{
    trippleBulb(bulbRad, bulbSeparation);
    translate([-20,0,0])
    trippleBulb(bulbRad, bulbSeparation);
    
    translate([-27.5,0,30])
    rotate([90,0,0])
    rotate_extrude(angle = 180)
    translate([7.5,0,0])
    circle(r = tubeRad );

    translate([-10,0,-8.5])
    rotate([-90,0,0])
    rotate_extrude(angle = 180)
    translate([10,0,0])
    circle(r = tubeRad );

    translate([-25,0,-10])
    rotate([-90,135,0])
    rotate_extrude(angle = 45)
    translate([10,0,0])
    circle(r = tubeRad );

    translate([-20,0,-43.5])
    rotate([90,0,0])
    rotate_extrude(angle = 45)
    translate([10,0,0])
    circle(r = tubeRad );

    translate([-22.2,0,-27])
    rotate([0,-45,0])
    cylinder(28,r=tubeRad, center=true);

    translate([-35,0,10])
    cylinder(40,r=tubeRad, center=true);
        
    translate([-10,0,-61])
    cylinder(35,r=tubeRad, center=true);

    translate([0,0,38])
    cylinder(20,r=tubeRad, center=true);

}

airlock(bulbRadius, bulbSeparation);


