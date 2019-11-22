 fontsize = 4;
 text = "";
 font = "Liberation Sans";
 

module myCylinder()
{
    cylinder(10, 5, 5, $fa = 4, $fs = 0.01);    
}

 values = [
   [-42, 2.4],
   [-28, 2.5],
   [-14, 2.6],
   [0, 2.7],
   [14, 2.8],
   [28, 2.9],
   [42, 3.0]
 ];

width = values[6][0] - values[0][0]  + values[1][0] - values[0][0];
 
// Bores
translate([0,-15,0])
{
    difference()
    {
    union()
    {
        translate([-width/2,-5,0])
        {
            cube(size=[width,16,2], center=false);
        }
        for (a = values) 
        {
            bore=a[1];
            translate([a[0],0,0])
            {
                myCylinder();
            
                translate([0, 6 , 0]) 
                linear_extrude(height = 4) 
                text(text = str(text,bore), font = font, size = fontsize, valign = "bottom", halign = "center");
            }
        }
    }
    union()
    {    
        for (a = values) 
        {
            translate([a[0],0,0])
            {
                bore=a[1];
                
                translate([0,0,-1])
                cylinder(  12,    bore,    bore, $fa = 4, $fs = 0.01);
                
            }
        }
    }
    }
}

// rods
translate([0,0,0])
{
    union()
    {
        translate([-width/2,0,0])
        {
            cube(size=[width,15,2], center=false);
        }

        for (a = values) 
        {
            translate([a[0],5,0])
            {
                bore=a[1];
                cylinder(  10,    bore,    bore, $fa = 4, $fs = 0.01);
  
                translate([0, 4 , 0]) 
                linear_extrude(height = 4) 
                text(text = str(text,bore), font = font, size = fontsize, valign = "bottom", halign = "center");
            }
        }
    }
    
}