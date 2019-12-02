$fn=100;

m1 = 0.159789289; // inner logo multiplier
m2 = 0.69666374; // logo circle multiplier

innerRadius = 50;
//innerWidth = 100/sqrt(2);
circleRadius = m2 * innerRadius;
innerLogoRadius = m1 * innerRadius;


module star() 
{
    points = [ [0, 0], [innerLogoRadius * sin(-22.7), innerLogoRadius * cos(-22.7)],[0, innerRadius],[innerLogoRadius * sin(22.7), innerLogoRadius * cos(22.7)]];

    linear_extrude(4)
    union()
    {
        for(a=[0:45:315])
        {
            rotate([0,0,a])
            polygon(points);
        }
    }
}


//star();
// coaster body
difference()
    {
    
        cylinder(6,55,55);
        union()
        {
            translate([0,0,2])
            cylinder(4.1,innerRadius,innerRadius);
            translate([0,0,-.1])
            intersection()
            {
                cylinder(10,circleRadius,circleRadius);
                translate([0,0,-.1])
                scale([1,1,4])
                star();    
            }
        }
    }

//Star Tips
difference()
{
    star();    
    translate([0,0,-.1])
    cylinder(6,circleRadius,circleRadius);
}

//circle minus star
difference()
{
    cylinder(4,circleRadius,circleRadius);
    translate([0,0,-.1])
    scale([1,1,2])
    star();    
}


*intersection()
{
    cylinder(10,circleRadius,circleRadius);
    translate([0,0,-.1])
    scale([1,1,4])
    star();    
}




