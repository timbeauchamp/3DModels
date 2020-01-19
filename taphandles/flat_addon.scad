$fn=80;
handleLen = 64.8;
handleMinDia = 17.1;
handleMaxDia = 22;
faceDiam = handleLen;

module handle()
{
cylinder(handleLen,handleMinDia/2,handleMaxDia/2);
}

difference()
{
    cylinder(2+handleMaxDia+2,faceDiam/2,faceDiam/2);
    union()
    {
        translate([faceDiam/2-handleLen-(faceDiam/2-(faceDiam/4 + 4)-1),0,handleMaxDia/2+2])
            rotate([0,90,0])
#                handle();
        translate([-faceDiam/4,-faceDiam/2,4])
            cube([faceDiam/2,faceDiam,2+handleMaxDia]);
        translate([faceDiam/4 + 4,-(handleMaxDia + 4)/2,2])
            cube([faceDiam/2,handleMaxDia + 4,2+handleMaxDia+1]);

        translate([faceDiam/4 + 4+2.9,0,2+handleMaxDia/2])
            rotate([90,0,0])
#               cylinder(faceDiam, 1.62, 1.62, true);

    }
}