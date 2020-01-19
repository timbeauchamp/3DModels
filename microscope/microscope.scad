$fn=10;

difference()
{
union()
{
difference()
{
    union()
    {
        translate([0,0,12.5])
        cube([136,200,25],center=true);
        translate([0,0,27.9])
        cube([124,188,6],center=true);
    }
    union()
    {
        translate([0,0,15.5])
        cube([116,180,33], center=true);
        translate([-45,-101,3.5])
        cube([90,13,30]);
        translate([-45,88,3.5])
        cube([90,13,30]);
        
         translate([57,-78,3.5])
        cube([13,156,30]);
         translate([-70,-78,3.5])
        cube([13,156,30]);
    }
}
translate([-59,80,0])
{   
    difference()
    {
        cube([11,11,2]);
        translate([6,5,-.1])
        cylinder(4,1.5,1.5);
    }
}

translate([48,80,0])
{
    difference()
    {
        cube([11,11,2]);
        translate([5,5,-.10])
        cylinder(4,1.5,1.5);
    }
}

translate([-59,-91,0])
{
    difference()
    {
        cube([11,11,2]);
        translate([6,6,-.10])
        cylinder(4,1.5,1.5);
    }
}

translate([48,-91,0])
{
    difference()
    {
        cube([11,11,2]);
        translate([5,6,-.10])
        cylinder(4,1.5,1.5);
    }
}
}
translate([-69,-75,-0.1])
cube([138,200,35]);


}