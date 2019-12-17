use <../../MCAD/stepper.scad>;
use <../../MCAD/motors.scad>;
$fn=100;
//dimensions from:
	// http://www.numberfactory.com/NEMA%20Motor%20Dimensions.htm

rotate([0,0,0])
translate([0,0,0]) //52
difference()
{
    union()
    {
        translate([0, 90, 0]) 
        cube([175,68,2]);
*        cube([175,90,2]);

        translate([50, 140, 0]) 
        linear_extrude(height = 4.5)
        text("Auto Dog", font = "Liberation Sans:style=Bold Italic");

        translate([75, 128, 0]) 
        linear_extrude(height = 4.5)
        text("15", font = "Liberation Sans:style=Bold Italic", size = 5);

        translate([75, 118, 0]) 
        linear_extrude(height = 4.5)
        text("30", font = "Liberation Sans:style=Bold Italic", size = 5);

        translate([75, 108, 0]) 
        linear_extrude(height = 4.5)
        text("1 Hr", font = "Liberation Sans:style=Bold Italic", size = 5);

        translate([75, 98, 0]) 
        linear_extrude(height = 4.5)
        text("2 Hr", font = "Liberation Sans:style=Bold Italic", size = 5);
        
        translate([20, 110, 5]) 
        scale([.2, .2, 0.05])
        surface(file = "openclose.png", center = true, invert = true);

        translate([45, 110, 5]) 
        scale([.2, .2, 0.05])
        surface(file = "clock.png", center = true, invert = true);

        translate([131, 110, 0]) 
        linear_extrude(height = 4.5)
        text("Adjust", font = "Liberation Sans:style=Bold Italic", size = 5);
        
        translate([120, 118, 0]) 
        linear_extrude(height = 4.5)
        text("Down", font = "Liberation Sans:style=Bold Italic", size = 5);
        
        translate([150, 118, 0]) 
        linear_extrude(height = 4.5)
        text("Up", font = "Liberation Sans:style=Bold Italic", size = 5);
        
*        translate([85, 50, 5]) 
        scale([.5, .5, 0.05])
        surface(file = "dog.png", center = true, invert = true);

    }
    translate([0,0,-.5])
    union()
    {
        translate([20,130,0])
        union()
        {
            translate([0,0,0])
            cylinder(4,3.5,3.5);
            translate([25,0,0])
            cylinder(4,3.5,3.5);
        }
        translate([80,130,0])
        union()
        {
            translate([50,0,0])
            cylinder(4,3.5,3.5);
            translate([75,0,0])
            cylinder(4,3.5,3.5);
        }

        translate([70,100,0])
        union()
        {
            translate([0,0,0])
            cylinder(4,1.6,1.6);
            translate([0,10,0])
            cylinder(4,1.6,1.6);
            translate([0,20,0])
            cylinder(4,1.6,1.6);
            translate([0,30,0])
            cylinder(4,1.6,1.6);
        }
    }
}


