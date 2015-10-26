#include "colors.inc"
#include "textures.inc"
#include "fishpaper.inc"

#local Height = 0.5;
#local Width = 0.75;
#local Radius = 0.02;
#local DeskHeight = Height + 1.027;

camera{location <0,2.9,-4> look_at <0,0,0> angle 0}

light_source{<0,10,0> color White*0.4}

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
	Paper(1)
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


//Fish - 2D
Fish2d(-6,0,0,0,10*sin(clock))
Fish2d(0,-5,0,180,10*sin(clock))
