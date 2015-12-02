#include "colors.inc"
#include "textures.inc"
#include "transforms.inc"
#include "fishpaper.inc"

#local Height = 0.5;
#local Width = 0.75;
#local Radius = 0.02;
#local DeskHeight = Height + 1.027;

camera{location <0,2.7,-3> look_at <0,0,0> angle 0}

light_source{<0,10,0> color White*0.9}

background{White}

plane{y,0 texture{Dark_Wood}}
plane{z, Width/2+1 texture{pigment{White*7}}}


//Table
union{
    //feet of the table
    cylinder{<0,0,0>,<0,Height,0>, Radius translate< Width/2 - Radius,0, -Width/2 + Radius>}
    cylinder{<0,0,0>,<0,Height,0>, Radius translate< Width/2 - Radius,0, Width/2 - Radius>}
    cylinder{<0,0,0>,<0,Height,0>, Radius translate< -Width/2 + Radius,0, Width/2 - Radius>}
    cylinder{<0,0,0>,<0,Height,0>, Radius translate< -Width/2 + Radius,0, -Width/2 + Radius>}

    //the desk
    box{<-Width/2, -0.025,-Width/2>,<Width/2,0,Width/2> translate<0,Height,0>}

    scale 3
    texture{pigment{ color rgb<0.8,0.6,0.3> * 2.5}}
    }

//Pencil
union{
    cylinder{<0,0,0>,<0.5,0,0.5> 0.03 texture{pigment{Yellow}}}
    cone{<0.5,0,0.5>, 0.03 <0.55,0,0.55>, 0.013 open texture{pigment{color rgb<0.8,0.6,0.3>}}}
    cone{<0.55,0,0.55>, 0.013 <0.58,0,0.58>, 0.004 open texture{pigment{Black}}}
    scale 0.5
    rotate<0,-20,0>
    translate<Width/1.1,Height+1.027,-Width/0.7>
    }

//Cup
union{
    //Body
    torus{0.09, 0.01 texture{pigment{Red}} scale <1,10,1>}        //Outer part
    torus{0.089, 0.01 texture{pigment{White*5}} scale <1,10,1>}   //Inner part
    cylinder{<0,-0.04,0>,<0,-0.05,0> 0.09 texture{pigment{Blue}}} //Bottom


    //Grip outer
    difference{
               torus{0.03,0.005 texture{pigment{Red}} scale <1,1,2> rotate<90,0,0>}
               sphere{<-0.3,0,0>, 0.302 texture{pigment{Red}}}
               translate<0.1,0,0>
              }

    //Grip inner
    difference{
               torus{0.029,0.005 texture{pigment{White*4}} scale <1,1,2> rotate<90,0,0>}
               sphere{<-0.3,0,0>, 0.302 texture{pigment{Red}}}
               translate<0.1,0,0>
              }


    translate<Width/1.1,Height+1.11,-Width/2>
    }


//Paper
object {
	Paper(1,0)
	translate <0, DeskHeight-0.035, 0>
}
// Axis
union {
	#declare L=8;
	// X
	box {
		<0,0,0>, <L,0.1,0>
		pigment { color Red }
	}
	// Y
	box {
		<0,0,0>, <0.1,L,0>
		pigment { color Green }
	}
	// Z
	box {
		<0,0,0>, <0.1,0,L>
		pigment { color Blue }
	}
}

#local DrawingHeight = DeskHeight - 0.03;

//Fish - 2D
object {
	Fish2d(10*sin(clock))
	translate <0.1,DrawingHeight,0.1>
	translate -0.1*clock*x
}
object {
	Fish2d(20*sin(clock))
	rotate <180,0,180>
	translate <0,DrawingHeight,-0.2>
}


#declare Fish1Path =
spline {
   cubic_spline
   #declare yoff=DrawingHeight;

   -2, <0, 0.5, 0>, // control point
   -1, <0, 0, 0>, // control point

   00, < 0, yoff+-0.2, 0>, // start
   01, < 0.25, yoff+1.125, 0>,
   02, < 0.5, yoff+1.5, 0>, // highest point
   03, < 0.75, yoff+1.125, 0>,
   04, < 1, yoff+-0.2, 0>, // end

   12, < 1, 1, 0>, // control point
   13, < 1, 0, 0>, // control point
}

#declare Fish2Path =
spline {
   cubic_spline
   #declare yoff=DrawingHeight;
   #declare zoff=0.1;

   -2, <0, 0.5, 0>, // control point
   -1, <0, 0, 0>, // control point

   00, < -0.1, yoff+-0.2, zoff>, // start
   01, < -0.25, yoff+0.1, zoff>,
   02, < -0.3, yoff+0.3, zoff>, // highest point
   03, < -0.35, yoff+0.1, zoff>,
   04, < -0.5, yoff+-0.2, zoff>,

   12, < 1, 1, 0>, // control point
   13, < 1, 0, 0>, // control point
}

// The yellow wire that shows the spline path.
union {
   #declare C = 0;
   #declare Cmax= 50;
   #declare dv = 5;
   #while (C<=Cmax)
      #declare Value1 = C/Cmax*dv;
      #declare Value2 = (C+1)/Cmax*dv;
      #declare Point1 = Fish1Path(Value1);
      #declare Point2 = Fish1Path(Value2);
      sphere {Point1, 0.015}
      cylinder {Point1, Point2, 0.01}
      #declare C = C+1;
   #end
   pigment {color <1,1,0>}
}

// The blue wire that shows the spline path.
union {
   #declare C = 0;
   #declare Cmax= 50;
   #declare dv = 5;
   #while (C<=Cmax)
      #declare Value1 = C/Cmax*dv;
      #declare Value2 = (C+1)/Cmax*dv;
      #declare Point1 = Fish2Path(Value1);
      #declare Point2 = Fish2Path(Value2);
      sphere {Point1, 0.015}
      cylinder {Point1, Point2, 0.01}
      #declare C = C+1;
   #end
   pigment {color <0,0,1>}
}

object {
	Fish3d
	rotate 90*y
	Spline_Trans(Fish1Path, clock, z, 0.5, 0.5)
}

object {
	Fish3d
	rotate 90*y
	rotate 90*z
	Spline_Trans(Fish2Path, max(clock-1.6,0), z, 0.5, 0.5)
}

