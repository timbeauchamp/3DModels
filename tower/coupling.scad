$fn=100;

pvcRad = (48.35 + 1) / 2;
towerRad = 63.5 / 2;
thickness = 3.12;
slipSpacing = .2;
height = 25.4;
stopRad = 2;

extentionInnerRad = pvcRad + slipSpacing;
extentionRad = extentionInnerRad + thickness;

innerRad=towerRad + slipSpacing;
outerRad=innerRad + thickness;
outerRingHole = outerRad + slipSpacing;

//outer ring
translate([-35,0,0])
{
    difference()
    {
        union()
        {
            cylinder(height,outerRad,outerRad);
        }
        translate([0,0,-.5])
        cylinder(height + 1,innerRad,innerRad);
    }

    difference()
    {
        cylinder(thickness,outerRad,outerRad);
        translate([0,0,-.5])        
            cylinder(height,extentionRad + slipSpacing, extentionRad + slipSpacing);
    }

    *cylinder(height,towerRad,towerRad);
}

//inner ring
translate([35,0,0])
{
    difference()
    {
        union()
        {
            cylinder(height,extentionRad, extentionRad);
        }
        translate([0,0,-.5])
        cylinder(height + 1,extentionInnerRad,extentionInnerRad);
    }

    translate([0,0,height/4])
        rotate_extrude()
            translate([extentionRad,0,0])
                circle(stopRad);
}
