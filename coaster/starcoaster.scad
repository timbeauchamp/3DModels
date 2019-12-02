
coasterRadius = 55; // [40, 45, 50, 55, 60]
coasterHeight = 5; // [4, 5, 6, 7]
rimWidth = 5; // [4, 5, 6]
numPoints = 8; // [4, 5, 6, 7, 8, 9, 10]


// coaster body
difference()
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
    translate([0,0,-1])
    cutout(numPoints,coasterHeight + 2,innerRadius,innerLogoRadius,circleRadius -1);
}


module cutout(numPoints = 8, height = 4 ,outerRad = 50, innerRad = 20, circleRad=40)
{
    intersection()
    {
        cylinder(height ,circleRad,circleRad);
        translate([0,0,-.5])
        star(numPoints,height,outerRad,innerRad);    
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

$fn=100;
m1 = 0.159789289; // inner logo multiplier
m2 = 0.69666374; // logo circle multiplier

innerRadius = coasterRadius - rimWidth;
circleRadius = m2 * innerRadius;
innerLogoRadius = m1 * innerRadius;

