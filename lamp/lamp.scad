$fn=50;

vAngle = 0;
hAngle = 0;
prevV = 0;
prevH = 0;
size = 60;

difference()
{
    sphere(size);

    union()
    {
        sphere(size-2);
        
        for(vAngle = [20 : 10 : 90])
        {
            vInc = cos(vAngle) * 18 + 15;
            hScale = sin(vAngle) * 3.7;
            echo("vAngle:",vAngle, " vInc:",vInc);
            for(hAngle = [0 : vInc : 360])
            {
                rotate([vAngle,0,hAngle])
                scale([hScale,2.3,1])
                cylinder(size*2.1,2,2,true);
            }    
        }
        
        cylinder(size * 2.1, 28, 28,true);
    }
}

intersection()
{
    sphere(size);
    difference()
    {
        cylinder(size * 2, 30, 30,true);
        cylinder(size * 2.1, 28, 28,true);
        for(vAngle = [20 : 10 : 90])
        {
            vInc = cos(vAngle) * 18 + 15;
            for(hAngle = [0 : vInc : 360])
            {
                rotate([vAngle,0,hAngle])
                cylinder(size*2.1,2,2,true);
            }
        }    
    }
}

translate([0,0,size - 3])
difference()
{
    cylinder(10.1, 30, 30,true);
    translate([0,0,0.1])
        cylinder(11, 28, 28,true);
    rotate([90,0,0])
        cylinder(65, 3.5, 3.5,true);
    
}