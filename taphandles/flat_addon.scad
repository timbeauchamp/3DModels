$fn=80;
handleBodyLen = 62.2;
handleTop = 2.6;
handleMinDia = 17.4;
handleMaxDia = 22.25;
faceDiam = handleBodyLen;
coverDiam = faceDiam + 10;
buffer = .5;

module handle()
{
    union()
    {
        cylinder(handleBodyLen,handleMinDia/2,handleMaxDia/2);
        translate([0,0,handleBodyLen])
        cylinder(handleTop,handleMaxDia/2, handleMaxDia/2*.9);
    }
}

module base()
{
    difference()
    {
        cylinder(2+handleMaxDia+2,faceDiam/2,faceDiam/2);
        union()
        {
            translate([faceDiam/2-handleBodyLen-(faceDiam/2-(faceDiam/4 + 4)-1),0,handleMaxDia/2+2])
                rotate([0,90,0])
                    scale([1.01,1.01,1])
                    handle();
            translate([-faceDiam/4,-faceDiam/2,4])
                cube([faceDiam/2,faceDiam,2+handleMaxDia]);
            translate([faceDiam/4 + 4,-(handleMaxDia + 4)/2,2])
                cube([faceDiam/2,handleMaxDia + 4,2+handleMaxDia+1]);

            translate([-faceDiam/2,(handleMaxDia + 4)/2 + 4,2])
                cube([faceDiam,20,handleMaxDia+3]);
            translate([-faceDiam/2,-((handleMaxDia + 4)/2 + 24),2])
                cube([faceDiam,20,handleMaxDia+3]);


            translate([faceDiam/4 + 4+5.5,0,2+handleMaxDia/2])
                rotate([90,0,0])
                   cylinder(faceDiam, 1.62, 1.62, true);

            translate([-faceDiam*3/8,0,handleMaxDia])
              cylinder(handleMaxDia/2, 1.62, 1.62, true);
        }
    }
}

module cover()
{
    difference()
    {
        union()
        {
            cylinder(6,coverDiam/2,coverDiam/2);
        }
        union()
        {
            baseY = handleMaxDia + 12;
            sliceoutY = faceDiam/2 - baseY/2 + buffer;
        
            translate([-coverDiam/2,-(baseY + buffer)/2,2])
                cube([faceDiam, baseY + buffer, 2+handleMaxDia+1]);

            translate([-coverDiam/2,baseY/2,2])
                difference()
                {
                   cube([faceDiam,sliceoutY,2.2]);
                    translate([faceDiam,sliceoutY/3.5,-0.1])
                    rotate([0,0,50])
                       cube([10,17,5]);
                }
            translate([-coverDiam/2,-(baseY/2+sliceoutY),2])
                difference()
                {
                   cube([faceDiam,sliceoutY,2.2]);
                    translate([faceDiam-14,0,-0.1])
                    rotate([0,0,-50])
                       cube([10,18,5]);
                }
            translate([-coverDiam/3,-(baseY/2+sliceoutY),2])
                    rotate([0,0,45])
                        cube([20,20,5]);
            translate([-coverDiam/3,3,2])
                    rotate([0,0,45])
                        cube([20,20,5]);

        }
    }
}

//base();

translate([faceDiam+10,0,coverDiam/2])
rotate([0,90,0])
cover();