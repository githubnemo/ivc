#include "glass.inc"

// Position <X,Y,Z>, angle A, fin angle FA
#macro Fish2d(X,Y,Z,A,FA)
	union {
	#declare Radius=2;
	#declare Thickness=0.2;
	#declare FinSide=1;
	#declare XSquish=0.8;

	// Body
	difference {
		cylinder {
			<0,0,Thickness>,<0,0,0>
			Radius
		}
		cylinder {
			<0,0,Thickness>,<0,0,0>
			Radius-Thickness
			open
		}
		scale <XSquish,0.4,1>
	}

	// Fin
	union {
		box {
			<0,0,Thickness>, <FinSide,Thickness,0>
			rotate <0,0,90>
		}
		box {
			<0,0,Thickness>, <FinSide-Thickness,Thickness,0>
		}
		box {
			<Thickness,0,Thickness>, <sqrt(FinSide*FinSide+FinSide*FinSide),Thickness,0>
			rotate <0,0,90+45>
			translate <FinSide,0,0>
		}
		rotate <0,0,-45>
		rotate FA*y
		translate <Radius*XSquish,-0.15,0>
		no_shadow
	}

	rotate <0,0,A>
	translate <X,Y,Z>
}
#end

#macro Paper(Width)
	union {
	box {
		<0,0.01,0>, <Width,0.01,Width/sqrt(2)>
		pigment { White }
		normal { bumps 0.1 }
	}
	//box {
		//<0,0,-0.01>, <Width,Width/sqrt(2),-0.01>
		//material {
			//texture {
				//pigment { color Col_Glass_Clear }
				//finish { F_Glass6 }
			//}
			//interior {
				//I_Glass_Exp(2)
				//fade_color color rgb <0.35, 0.65, 0.85>
			//}
		//}
	//}
	translate <-Width/2,0,-Width/sqrt(2)/2>
	//plane { z, 0
		//translate <0,0,0.1>
		//hollow on
		//pigment { White }
	//}
	//plane { <0,0,1>, 10
		//hollow on
		//pigment { White filter 1 }
		//finish {reflection 0.1 }
		//interior { ior 1.1 caustics 1.0 }
		//translate <0, 0, -10>
////		normal { bumps 0.5 }
	//}
}
#end
