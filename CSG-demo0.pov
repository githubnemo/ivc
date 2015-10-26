#include "colors.inc"
background { Magenta }
camera {
	//location <0, -20, -10>
	location <0, -30, -30>
	look_at <0, 0, 0>
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


// Position <X,Y,Z>, angle A
#macro Fish2d(X,Y,Z,A)
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
	object {
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
			translate <Radius*XSquish,-0.15,0>
		}
		rotate <0,10*sin(clock),0>
	}

	rotate <0,0,A>
	translate <X,Y,Z>
}
#end

#declare Paper = union {
	#declare Width=20;
	box {
		<0,0,0.01>, <Width,Width/sqrt(2),0.01>
		pigment { White }
		normal { bumps 0.1 }
	}
	translate <-Width/2,-Width/sqrt(2)/2,0>
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

Paper
Fish2d(-6,0,0,0)
Fish2d(0,-5,0,180)
