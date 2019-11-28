use <../../MCAD/stepper.scad>;
use <../../MCAD/motors.scad>;
$fn=100;
//dimensions from:
	// http://www.numberfactory.com/NEMA%20Motor%20Dimensions.htm

module prism(l, w, h)
{
    polyhedron(
            points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
            );
}
   
   

// base
translate([-70,-30,0])
difference()
{
    cube([70, 60,2.5], false);
    translate([48,8,-.1])
    cylinder(3.2,1.6,1.6,false);
    translate([48,52,-.1])
    cylinder(3.2,1.6,1.6,false);
    
}

// pulley axel
translate([-59,0,0])
difference()
{
    cylinder(18,2.35,2.35,false);
    translate([0,0,8])
    cylinder(10.1,1,1,false);
}
//motor support
translate([-10.6,0,2])
{
    translate([10.5,-24.5,0])
    rotate([0,0,90])
    prism(2.5, 5.5, 12);

    translate([3,-24.5,0])
    cube([2, 2.5, 12], false);

    translate([10.5,22,0])
    rotate([0,0,90])
    prism(2.5, 5.5, 12);

    translate([3,22,0])
    cube([2, 2.5, 12], false);

    difference()
    {
    translate([0,-24.5,0])
    cube([3,49,50],false);
    
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
