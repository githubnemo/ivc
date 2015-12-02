#version 3.7;
#include "colors.inc"
#include "textures.inc"
#include "transforms.inc"
#include "fishpaper.inc"
#include "titlepage.inc"

#local Height = 0.5;
#local Width = 0.75;
#local Radius = 0.02;
#local DeskHeight = Height + 1.027;
#local TitleTime = 10;
#local PaperFocusTime = 13;
#local TopViewElapseTime = 16;
#local ZoomUpperBound = 14;
#local StandardFadeDist = 8;
#local FadingOffset = 0.5; //How long to wait until beginning of fading
#local DecFadingRate = StandardFadeDist*(1-(clock-ZoomUpperBound-FadingOffset));
#local IncFadingRate = (StandardFadeDist/3)*(clock-TopViewElapseTime);


global_settings{ambient_light rgb<0,0,0>}

#if(clock < TitleTime)
    Title()
#else

#if(clock >= TitleTime & clock < TopViewElapseTime+FadingOffset)
    #if(clock < PaperFocusTime)
        camera{location <0,2.5,0> look_at <0,0,0> angle 50}
    #end
    //Zooming upwards away from the paper -> For test purposes change the povray.ini initial_frame variable to 90 or more frames
    #if(clock >= PaperFocusTime & clock <= ZoomUpperBound)
        camera{location <0,2.5,0> look_at <0,0,0> angle 50*((clock-PaperFocusTime)+1)}
    #end
    #if(clock > ZoomUpperBound)
        camera{location <0,2.5,0> look_at <0,0,0> angle 100}
    #end
#else
    camera{location <0,2,-1.7> look_at <0,1,0> angle 90}
#end

//Create fading
#if (clock >= TitleTime & clock < ZoomUpperBound+FadingOffset)
    light_source{<0,10,-1> color White*1.1 fade_distance StandardFadeDist fade_power 1}
#end

#if (clock >= ZoomUpperBound+FadingOffset & clock <= TopViewElapseTime+FadingOffset)
light_source{<0,10,-1> color White*1.1 fade_distance DecFadingRate fade_power 1}
#end

#if(clock > TopViewElapseTime+FadingOffset)
    #declare fade_dist = IncFadingRate / (0.3*StandardFadeDist);
    #if(fade_dist < 1)
        light_source{<0,10,-1> color White*1.1 fade_distance 1 fade_power 1}
    #else
        light_source{<0,10,-1> color White*1.1 fade_distance fade_dist fade_power 1}
    #end
#end

//background{White}

plane{y,0 texture{Dark_Wood}}
plane{z, Width/2+1 texture{pigment{White*7}}}

//Include prepared Post-It image
box{<0,0,0>,<0.5,0.005,0.5> texture{pigment{ image_map{png "Images/PostIt.png" map_type 0}}} rotate<0,-15,0> scale 0.4 translate<-0.8,Height+1,-0.55>}


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
    cylinder{<0,-0.04,0>,<0,-0.05,0> 0.09 texture{pigment{Brown*0.2}}} //Bottom


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
	Paper(1,0.01,0)
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

#declare Scene1Clock = (clock - TitleTime);
#declare Scene2Clock = (clock - TopViewElapseTime+FadingOffset);

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

#declare Boundary = difference {
	object {
		Paper(1,0.1,0)
		scale 1.5
		translate <0, DeskHeight-0.05, 0>
	}
	object {
		Paper(1,0.2,0)
		translate <0, DeskHeight-0.05, 0>
	}
}

#macro BoundedThing(Thing)
	difference {
		object { Thing }
		object { Boundary }
	}
#end

//Fish - 2D
BoundedThing(object {
	Fish2d(10*sin(clock))
	translate <0.5,DrawingHeight,0.1>
	translate -0.07*max(Scene1Clock,0)*x
	translate -0.03*max(Scene2Clock,0)*x
	#if (Scene2Clock >= 3 & Scene2Clock < 6)
		pigment { color rgbt <1, 1, 1, 1> }
		no_shadow
	#end
})

object {
	Fish2d(20*sin(clock))
	rotate <180,0,180>
	translate <0,DrawingHeight,-0.2>
}



#if (Scene2Clock > 0)
object {
	Fish3d
	rotate 90*y
	Spline_Trans(Fish1Path, Scene2Clock, z, 0.5, 0.5)
}

object {
	Fish3d
	rotate 90*y
	rotate 90*z
	Spline_Trans(Fish2Path, max(Scene2Clock-2.4,0), z, 0.5, 0.5)
}
#end

#end
