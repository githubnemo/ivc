#include "stdinc.inc"
#include "colors.inc"
#include "transforms.inc"
#include "fishpaper.inc"

background { White }
camera {
	//location <0, -20, -10>
#if (1 = 1)
	location <0, 0.5, -3>
	look_at <0, 0.5, 0>
#else
	location <0, 2, 0>
	look_at <0, 0, 0>
#end
	angle 0
}
light_source { <500, 500, -1000> White }

box {
	<3,3,0>, <4,4,4>
	pigment { Blue }
}


// Axis
union {
	#declare L=8;
	// X
	box {
		<0,0,0>, <L,0,0.1>
		pigment { color Red }
	}
	// Y
	box {
		<0,0,0>, <0,L,0.1>
		pigment { color Green }
	}
	// Z
	box {
		<0,0,0>, <0.1,0,L>
		pigment { color Blue }
	}
}

object {
	Paper(1,0)
}

object {
	Fish2d(0)
	translate <0,0.01,0>
	no_shadow
}



#declare MySpline =
spline {
   cubic_spline

   -2, <0, 0.5, 0>, // control point
   -1, <0, 0, 0>, // control point

   00, < 0, -0.2, 0>, // start
   01, < 0.25, 1.125, 0>,
   02, < 0.5, 1.5, 0>, // highest point
   03, < 0.75, 1.125, 0>,
   04, < 1, -0.2, 0>,

   12, < 1, 1, 0>, // control point
   13, < 1, 0, 0>, // control point
}

#declare Fish2Path =
spline {
   cubic_spline
   #declare zoff=0.1;

   -2, <0, 0.5, 0>, // control point
   -1, <0, 0, 0>, // control point

   00, < -0.1, -0.2, zoff>, // start
   01, < -0.25, 0.1, zoff>,
   02, < -0.3, 0.3, zoff>, // highest point
   03, < -0.35, 0.1, zoff>,
   04, < -0.5, -0.2, zoff>,

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
      #declare Point1 = MySpline(Value1);
      #declare Point2 = MySpline(Value2);
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
// Spline_Trans (Spline, Time, SkyVector, ForeSight, Banking)

object {
	Fish3d
//	sphere { <0,0,0> 0.1 }
	rotate 90*y
	Spline_Trans(MySpline, clock, z, 0.5, 0.5)
}

object {
	Fish3d
//	sphere { <0,0,0> 0.1 }
	rotate 90*y
	rotate 90*z
	Spline_Trans(Fish2Path, clock, z, 0.5, 0.5)
}

