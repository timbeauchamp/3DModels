use <../../MCAD/stepper.scad>;
use <../../MCAD/motors.scad>;
$fn=100;
//dimensions from:
	// http://www.numberfactory.com/NEMA%20Motor%20Dimensions.htm

difference()
{
translate([-100,-50,0])
cube([140, 100,2.5], false);

union()
{
    translate([10,5,-.5])
    cube([20, 40,3.5], false);

    translate([10,-45,-.5])
    cube([20, 40,3.5], false);

    translate([-30,5,-.5])
    cube([20, 40,3.5], false);

    translate([-30,-45,-.5])
    cube([20, 40,3.5], false);

    translate([-55,5,-.5])
    cube([20, 40,3.5], false);

    translate([-55,-45,-.5])
    cube([20, 40,3.5], false);

    translate([-85,5,-.5])
    cube([20, 40,3.5], false);

    translate([-85,-45,-.5])
    cube([20, 40,3.5], false);
   
}        
}

translate([-1,-20,0])
cube([5, 40, 5], false);

translate([-2,-20,0])
cube([7, 40,4], false);

translate([-59,0,0])
union()
{
    cylinder(15,2.3,2.3,false);
    cylinder(3,4,4,false);
}

translate([0,0,3])
difference()
{
    translate([0,-20,0])
    cube([3,40,50],false);
    
    translate([3.4,0,30])
    rotate([0,-90,0])
    union()
    {   
      cylinder(3,11.2,11.2,false);
      cylinder(10,2.9, 2.9);

      translate([0,0,3]) 
//     stepper_motor_mount(17,slide_distance=0, mochup=false, tolerance=0);

      for(r=[45:90:315])
      {
          rotate([0,0,r])
          translate([21.9,0,-5])
          cylinder(10,1.52,1.52);
      }


  }
}