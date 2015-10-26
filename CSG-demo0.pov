#include "colors.inc"
#include "fishpaper.inc"

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


