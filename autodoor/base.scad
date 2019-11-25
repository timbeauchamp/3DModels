use <../../MCAD/stepper.scad>;
use <../../MCAD/motors.scad>;
$fn=100;
//dimensions from:
	// http://www.numberfactory.com/NEMA%20Motor%20Dimensions.htm

// base
difference()
{
    translate([-70,-30,0])
    cube([70, 60,2.5], false);

    union()
    {
        translate([-55,5,-.5])
        cube([20, 20,3.5], false);

        translate([-55,-25,-.5])
        cube([20, 20,3.5], false);
    }        
}

// pulley axel
translate([-59,0,0])
union()
{
    cylinder(20,2.3,2.3,false);
    cylinder(4,6,6,false);
}

//motor support
translate([-16,0,3])
{
    translate([-1,-20,-2])
    cube([5, 40, 7], false);

    translate([-3,-20,-2])
    cube([9, 40,4], false);

    difference()
    {
    translate([0,-20,0])
    cube([3,40,50],false);
    
    translate([3.4,0,30])
    rotate([0,-90,0])
    union()
    {   
      cylinder(5,11.2,11.2,false);
      cylinder(8,2.9, 2.9);

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
}
