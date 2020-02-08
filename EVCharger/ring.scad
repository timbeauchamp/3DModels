$fn=30;
module ring()
{
    linear_extrude(5)
    scale([1.5,1])
    offset(r=1)
    difference()
    {
        circle(25);
        union()
        {
            circle(20);
            translate([-17,0,0])
            square([17,36], center=true);
        }
    }
}

ring();

render(convexity = 2)
translate([0,0,4.9])
difference()
{
    ring();
    translate([-8,0,11])
    rotate([0,80,0])
    cube([20,60,60], center=true);
}

translate([58,0,8])
cube([40,2.75,18],center=true);


translate([56,0,8+sin(30)*20])
rotate([0,-30,0])
union()
{
    difference()
    {
        union()
        {
            cube([40,2.75,16],center=true);
            
            translate([20,0,0])
            rotate([90,0,0])
            cylinder(2.7,d=16,center=true);

            translate([-20,0,0])
            rotate([90,0,0])
            cylinder(2.7,d=16,center=true);
            
            translate([18.5,0,-8])
            cube([10,2.75,16],center=true);

        }

        translate([20,0,0])
            rotate([90,0,0])
                cylinder(3,r=2,center=true);
    }

    translate([8,0,32.5])
    difference()
    {
        union()
        {
            cube([10,2.75,65],center=true);
            translate([7,0,-20])
            cube([4.1,2.75,22],center=true);
            translate([-9,0,9])
            cube([10,2.75,83],center=true);
        }
        translate([-11.1,0,41])
            cube([6,2.8,5],center=true);
    }
}