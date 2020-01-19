use <../../MCAD/stepper.scad>;
use <../../MCAD/motors.scad>;
$fn=100;
//dimensions from:
	// http://www.numberfactory.com/NEMA%20Motor%20Dimensions.htm
showTop = false;
showBase = true;
showSpacer = false;

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
    cylinder(3.5,5,5,false);
    translate([0,0,-.1])
    cylinder(38,1.85,1.85,false);

}

// base
if(showBase)
{translate([-70,-30,0])
difference()
{
    union()
    {
        cube([70, 60,2.5], false);

        translate([-48,20,0])
        cube([50,20,2.5 ],false);

        translate([3.5,-15,0])
        cube([15, 90,2.5], false);

        translate([3.5,72,0])
        cube([15, 3,35], false);
        translate([3.5,-15,0])
        cube([15, 3,35], false);  // add back
        translate([10.5,-20,0])
        cube([3, 5,22], false);  // add back
        translate([10.5,75,0])
        cube([3, 5,22], false);  // add back

        
    }
    translate([48,8,-.1])
    cylinder(3.2,1.6,1.6,false); // Mounting hole
    translate([48,52,-.1])
    cylinder(3.2,1.6,1.6,false); // Mounting hole

    translate([11,30,-.5])
    cylinder(5,1.62,1.62,false); // pulley axle hole
}
//Stepper motor support
*translate([-10.6,0,2])
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

//Gear motor support
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
    cube([3,49,45],false);
    
    translate([3.4,0,28.77])
    rotate([0,-90,0])
    union()
    {   
      cylinder(8,6,6);
      translate([0,-6,0])
        cube([22,9,4]);

      translate([5,-25,0])
        cube([12,20,4]);

      translate([8.9,8.4,0])
      cylinder(4,1.5,1.5);

      translate([-8.9,8.4,0])
      cylinder(4,1.5,1.5);

      translate([0,-11.3,0])
      cylinder(4,2.1,2.1);
  }
}
}


//encoder support
translate([-107.4,0,2])// -10.6 butt-59 half
rotate([0,0,180])
{
    translate([10.5,-10,0])
    rotate([0,0,90])
    prism(2.5, 5.5, 12);

    translate([3,-10,0])
    cube([2, 2.5, 12], false);

    translate([10.5,7.5,0])
    rotate([0,0,90])
    prism(2.5, 5.5, 12);

    translate([3,7.5,0])
    cube([2, 2.5, 12], false);

    difference()
    {
    translate([0,-10,0])
    cube([3,20,40],false);
    
    translate([3.4,0,28.77])
    rotate([0,-90,0])
    union()
    {   
      cylinder(8,5,5);
    }
}
}
}



if(showTop)
// top
rotate([0,0,0])
//translate([-70,-30,52]) //52
translate([5,-30,0]) //52
difference()
{
    union()
    {
        translate([1,-17.5,0])
        cube([20, 95,3], false);
        translate([1,69.5,0])
        cube([20, 8,13], false);
        translate([1,-17.5,0])
        cube([20, 8,13], false);
        
*        translate([1,69.5,13])
        cube([20, 8,2], false);
*        translate([1,-17.5,13])
        cube([20, 8,2], false);
    }
#    union()
    {
        translate([3.3,71.8,-.25])
        cube([15.4, 3.4, 14], false);
        translate([3.3,-15.2,-.25])
        cube([15.4, 3.4, 14], false);
        
        translate([11,30,8])
        rotate([90,0,0])
        cylinder(97,1.62,1.62,true); // Cross piece holes

        translate([11,30,-.5])
        cylinder(5,1.62,1.62,false); // pulley axle hole
    }
}


