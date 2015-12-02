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


#declare ShinyFinish =
finish {
   diffuse 0.7
   reflection {0.1, 1.0 fresnel}
   specular 1 roughness 0.0035 metallic
}

#declare Fish3d = union {
	// Angle fins are standing off off body
	#declare SideFinAngle = 10;

	// Waggle the tail. -15..15 looks good.
	#declare TailFinAngle = 0;

	#declare FishColor = <0,0.7,1>;

	// Body
	sphere {
		0 0.08
		scale <1,0.5,0.3>

		pigment {
			rgb FishColor
		}
	}

	// Right Fin
	sphere {
		0 0.03
		scale <1, 0.5, 0.15>
		rotate <0,-SideFinAngle,-15>
		translate <0,-0.02,0.03>

		pigment { rgb FishColor filter 0.9 }
	}

	// Left Fin
	sphere {
		0 0.03
		scale <1, 0.5, 0.15>
		rotate <0,SideFinAngle,-15>
		translate <0,-0.02,-0.03>

		pigment { rgb FishColor filter 0.9 }
	}

	// Tail Fin
	cone {
		<0.07, 0, 0>, 0.03, < 0, 0, 0>, 0.0001
		scale <1,1,0.3>
		rotate TailFinAngle*y
		translate <0.05,0,0>

		pigment { rgb FishColor }
	}

	finish { ShinyFinish }

	normal { bumps 12 }
}
