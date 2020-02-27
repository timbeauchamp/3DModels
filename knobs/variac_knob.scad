$fn=50;

//  Veriac Knob 
//  Tim Beauchamp

// Art Deco ridges
for(a = [0 : 45 : 360-45])
{
    rotate([0,0,a])
    {
        translate([-26.5,0,0])
        union()
        {
            rotate([0,90 - atan(5/26.5),0])
            cylinder(26.5,5,0);
            sphere(5);
            difference()
            {
                translate([0,0,-21])
                    cylinder(21,5,5);
                translate([-.5,-6,-22])
                    cube([6,12,21]);
            }
        }
    }
}

// Body of the knob itself
translate([0,0,-24])
difference()
{
    rotate_extrude(angle = 360, convexity = 2) 
    {
        translate([-32.875,0,0])
            polygon(points=[[0,0],[5,0],[5,3],[9,7],[9,16],[17,22],[17,0],[28,0],[28,22.4],[32.875,27],[32.875,29.5],[9,25.5],[8,25.2],[6.5,24.5],[5.75,23.5],[5,22],[5,7],[0,2]]);
    }
    for(a = [0 : 90 : 90])
    {
        translate([0,0,12])
        union()
        {
            rotate([0,90,a-22.5])
            union()
            {
                cylinder(20,d=4);
                translate([0,0,22])
                    cylinder(7,d=8.2);
                translate([4,0,10])
                    cube([17.5,9.5,3.5],center = true);
            }
        }
    }
}


// Pointer
pointerPoints = [
  [  0,  -10,  0 ],  //0
  [ 15,  -4,  0 ],  //1
  [ 15,  4,  0 ],  //2
  [  0,  10,  0 ],  //3
  [  0,  -10,  10 ],  //4
  [ 15,  -4,  4 ],  //5
  [ 15,  4,  4 ],  //6
  [  0,  10,  10 ]]; //7
  
pointerFaces = [
  [0,1,2,3],  // bottom
  [4,5,1,0],  // front
  [7,6,5,4],  // top
  [5,6,2,1],  // right
  [6,7,3,2],  // back
  [7,4,0,3]]; // left
 
rotate([0,0,22.5])
translate([26.5,0,-24])
difference()
{
    polyhedron( pointerPoints, pointerFaces );
    union()
    {
        translate([0,0,10])
            rotate([0,90 + atan(6/15),0])
                cylinder(17,d=1);
        translate([15,0,0])
            cylinder(5,d=1);
    }
}

