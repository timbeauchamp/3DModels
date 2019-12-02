include <defaultparams.scad>

coasterRadius = 55; // [40, 45, 50, 55, 60]
coasterHeight = 5; // [4, 5, 6, 7]
rimWidth = 5; // [4, 5, 6]
numPoints = 8; // [4, 5, 6, 7, 8, 9, 10]

innerRadius = coasterRadius - rimWidth;
circleRadius = m2 * innerRadius;
innerLogoRadius = m1 * innerRadius;

// coaster body
*difference()
{
    union()
    {
        difference()
        {
            cylinder(coasterHeight,coasterRadius,coasterRadius);
            translate([0,0,2])
            cylinder(coasterHeight,innerRadius,innerRadius);
        }
        cylinder(coasterHeight,circleRadius,circleRadius);
        starTips(numPoints,coasterHeight,innerRadius,innerLogoRadius,circleRadius);
    }
    translate([0,0,-.1])
    cutout(numPoints,coasterHeight,innerRadius,innerLogoRadius,circleRadius);
}

cutout(numPoints,coasterHeight,innerRadius,innerLogoRadius,circleRadius);

module cutout(numPoints = 8, height = 4 ,outerRad = 50, innerRad = 20, circleRad=40)
{
    intersection()
    {
        cylinder(height + 1 ,circleRad,circleRad);
        translate([0,0,-.1])
        star(numPoints,height + 2,outerRad,innerRad);    
    }
}

module star(numPoints = 8, height = 4 ,outerRad = 50, innerRad = 20) 
{
    totalPoints = numPoints * 2;
    increment = 360/totalPoints;
    
    function getPoint(a,r) = ([sin(a) * r, cos(a) * r]);
        
    points = [ for(a=[0:increment:361 - increment]) (getPoint(a,((a % (increment * 2)) <= .01? outerRad : innerRad)))];
    echo(points);
    linear_extrude(height)
    polygon(points);
}


//Star Tips
module starTips(numPoints = 8, height = 4 ,outerRad = 50, innerRad = 20, circleRad=40)
{
    difference()
    {
        star(numPoints,height,outerRad,innerRad);    
        translate([0,0,-.1])
        cylinder(height + 1,circleRad,circleRad);
    }
}
