use <../../MCAD/stepper.scad>;
use <../../MCAD/motors.scad>;
$fn=100;
//dimensions from:
	// http://www.numberfactory.com/NEMA%20Motor%20Dimensions.htm
showTop = false;
showBase = false;
showSpacer = true;

module prism(l, w, h)
{
    polyhedron(
            points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
            faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
            );
}
   
if(showSpacer)
translate([35,-15])
difference()
{
    cylinder(36.4,5,5,false);
    translate([0,0,-.1])
    cylinder(38,1.75,1.75,false);

}

// base
if(showBase)
{translate([-70,-30,0])
difference()
{
    union()
    {
        cube([70, 60,2.5], false);
        translate([3.5,-15,0])
        cube([15, 90,2.5], false);

        translate([3.5,72,0])
        cube([15, 3,52], false);
        translate([3.5,-15,0])
        cube([15, 3,52], false);
    }
    translate([48,8,-.1])
    cylinder(3.2,1.6,1.6,false); // Mounting hole
    translate([48,52,-.1])
    cylinder(3.2,1.6,1.6,false); // Mounting hole

    translate([11,30,-.5])
    cylinder(5,1.62,1.62,false); // pulley axle hole
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
    
//    translate([0,0,-1.230])
    translate([3.4,0,28.77])
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
      translate([10,-2.50,0])
        cube([12,5,4]);

  }
}
}
}



if(showTop)
// top
rotate([180,0,0])
//translate([-70,-30,52]) //52
translate([5,-30,-3]) //52
difference()
{
    union()
    {
        translate([18.5,22.5,0])
        cube([44, 15,3], false);
        translate([1,-17.5,0])
        cube([20, 95,3], false);
        translate([1,69.5,-13])
        cube([20, 8,13], false);
        translate([1,-17.5,-13])
        cube([20, 8,13], false);
        
        
        difference()
        {
            translate([56.9,2.5,-3])
            cube([8, 55,6], false);
            union()
            {
                translate([59.3,5.4,-5])
               cube([3.2, 49.2,5], false);
                translate([55,9.4,-5])
               cube([13.2, 41.2,5], false);
            }
        }
    }
        translate([3.3,71.8,-15])
        cube([15.4, 3.4, 15], false);
        translate([3.3,-15.2,-15])
        cube([15.4, 3.4, 15], false);
        
        translate([11,30,-6.5])
        rotate([90,0,0])
       cylinder(97,1.62,1.62,true); // pulley axle hole
    
    translate([11,30,-.5])
    cylinder(5,1.62,1.62,false); // Cross piece holes
}


