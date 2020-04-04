$fn=70;

//119 x 30

RADIUS=80;
BASEWIDTH=5.3;
BASEHIEGHT=3.85;
VANEWIDTH=1.15;
CHANNELWIDTH=.6;
HEIGHT=13;
INSIDEHEIGHT=2.7;


difference()
{
    union()
    {
        rotate_extrude(angle = 360, convexity = 2) 
        translate([-RADIUS,0,0])
        polygon(points=[[0,0],[BASEWIDTH, 0],[BASEWIDTH,INSIDEHEIGHT],[2*VANEWIDTH + CHANNELWIDTH, BASEHIEGHT],
        [2*VANEWIDTH + CHANNELWIDTH, HEIGHT], [VANEWIDTH + CHANNELWIDTH, HEIGHT], [VANEWIDTH + CHANNELWIDTH, 2],
        [VANEWIDTH, 2], [VANEWIDTH, HEIGHT], [0, HEIGHT]]);

        for(a=[0:30:360])
        {
            rotate([0,0,a+15])
            translate([0, RADIUS,6.5])
            rotate([90,0,0])
            union()
            {
                cylinder(VANEWIDTH + .6, d=6.6, center=true);
                cylinder(VANEWIDTH+CHANNELWIDTH+.6, 4, 1);
            }
        }

    }
    union()
    {
       cube([.5,2*RADIUS+2,2*HEIGHT+2],center=true);
       cube([2*RADIUS+2,.5,2*HEIGHT+2],center=true);
        
        for(a=[0:30:360])
        {
            translate([0,0,HEIGHT/2])
            rotate([90,0,a+15])
            cylinder(2*(RADIUS - VANEWIDTH- CHANNELWIDTH), d=6, center=true);
        }
        
    }
}

