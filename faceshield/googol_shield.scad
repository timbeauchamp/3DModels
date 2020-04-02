$fn=70;

linear_extrude(20)
union()
{ 
    translate([0,25,0])
    difference()
    {
        circle(100);
        union()
        {
            circle(98);
            translate([0,-35,0])
            {
                square([210,135],center=true);
            }
        }
    }
    
    translate([0,40,0])
    difference()
    {
        circle(85);
        union()
        {
            circle(83);
            translate([0,-45,0])
            {
                square([180,90],center=true);
            }
        }
    }

    difference()
    {
        circle(85);
        union()
        {
            circle(83);
            translate([0,-45,0])
            {
                square([180,90],center=true);
            }
        }
    }

    translate([-84,11.5,0])
    square([2,57.5],center=true);

    translate([84,11.5,0])
    square([2,57.5],center=true);

    translate([53.3,106.1,0])
    rotate([0,0,53])
    square([3,20],center=true);

    translate([-53.3,106.1,0])
    rotate([0,0,-53])
    square([3,20],center=true);
}

translate([84,-17,10])
rotate([0,90,0])
scale([1,.5,1])
cylinder(2,d=20,center=true);

translate([-84,-17,10])
rotate([0,90,0])
scale([1,.5,1])
cylinder(2,d=20,center=true);

translate([-90.32414952, 72.05009636,2.5])
//translate([90,70,2.5])
rotate([-90,0,90])
{
    cylinder(7, d=5, center=true);
    translate([0,0,3.5])
        sphere(d=5);
}

translate([0,126,2.5])
rotate([-90,0,0])
{
    cylinder(5, d=5, center=true);
    translate([0,0,2.55])
        sphere(d=5);
}


translate([90.32414952, 72.05009636,2.5])
//translate([90,70,2.5])
rotate([-90,0,-90])
{
    cylinder(7, d=5, center=true);
    translate([0,0,3.5])
        sphere(d=5);
}


// band holder
translate([90,0,10])
rotate([-90,0,0])
{
    difference()
    {    
         union()
        {
            cylinder(15, d=5, center=true);
            translate([0,0,7.5])
                sphere(d=5);
            translate([0,0,-7.55])
                sphere(d=5);
            translate([-3.5,01,0])
                cube([7,3,8],center=true);
        }
        union()
        {
            rotate([0,0,50])
            translate([-3,04,0])
            cylinder(15, d=5, center=true);
        }
    }
    prism(6, 8, 6.71,4);
}

// band holder
translate([-90,0,10])
rotate([90,180,0])
{
    difference()
    {    
         union()
        {
            cylinder(15, d=5, center=true);
            translate([0,0,7.5])
                sphere(d=5);
            translate([0,0,-7.55])
                sphere(d=5);
            translate([-3.5,01,0])
                cube([7,3,8],center=true);
        }
        union()
        {
            rotate([0,0,50])
            translate([-3,04,0])
            cylinder(15, d=5, center=true);
        }
    }
    prism(6, 8, 7.71,4);
}
module prism(l, w, h, l2)
{
    translate([w-7,2.3,l/2])
    rotate([0,90,90])
       polyhedron(
               points=[[-l2,0,0], [l+l2,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );

}


translate([83,15,7])
rotate([90,0,90])
linear_extrude(3)
    text("Googol", size = 5, font="Liberation Sans:style=Bold");

