#include "glass.inc"
#include "functions.inc"

// fin angle FA
#macro Fish2d(FA)
	union {
	#declare Radius=2;
	#declare Thickness=0.2;
	#declare FinSide=1;
	#declare XSquish=0.8;

	// Body
	difference {
		cylinder {
			<0,0,0>,<0,Thickness,0>
			Radius
		}
		cylinder {
			<0,0,0>,<0,Thickness,0>
			Radius-Thickness
			open
		}
		scale <XSquish,1,0.4>
	}

	// Fin
	union {
		box {
			<0,0,0>, <FinSide,Thickness,Thickness>
			rotate -90*y
		}
		box {
			<0,0,0>, <FinSide-Thickness,Thickness,Thickness>
		}
		box {
			<Thickness,Thickness,0>, <sqrt(FinSide*FinSide+FinSide*FinSide),Thickness,Thickness>
			rotate -(90+45)*y
			translate <FinSide,0,0>
		}
		rotate 45*y
		rotate FA*z
		translate <Radius*XSquish,0,0>
		no_shadow
	}
	scale 0.04
}
#end

#declare RMF=function{ f_ridged_mf(x, y, z, 0.07, 2.2,  7, 0.6, 0.9, 1)}

// Paper side width `Width`, use reflection flag `R`
#macro Paper(Width,R)
	union {

		box {
			<0,0.01,0>, <Width,0.01,Width/sqrt(2)>
			pigment { White }
			normal { bumps 0.1 }
		}

		#if (R = 1)
		box {
			<0,0.01,0>, <Width,0.015,Width/sqrt(2)>
			material {
				texture {
					pigment { color Col_Glass_Clear }
					finish { F_Glass6 }
				}
				interior {
					I_Glass_Exp(2)
					fade_color color rgb <0.85, 0.85, 0.85>
				}
			}
			normal {
				function { RMF(x, y, z) } 1.3
				scale 0.2
			}
		}
		#end
		translate <-Width/2,0,-Width/sqrt(2)/2>
	}
#end
