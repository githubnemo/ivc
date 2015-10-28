#include "colors.inc"
#include "fishpaper.inc"

background { Magenta }
camera {
	//location <0, -20, -10>
#if (1 = 0)
	location <0, 0, -2>
#else
	location <0, 2, 0>
#end
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

#declare ShinyFinish =
finish {
   diffuse 0.7
   reflection {0.1, 1.0 fresnel}
   specular 1 roughness 0.0035 metallic
}

union {
	// Angle fins are standing off off body
	#declare SideFinAngle = 10;

	// Waggle the tail. -15..15 looks good.
	#declare TailFinAngle = 0;

	// Body
	sphere {
		0 0.08
		scale <1,0.5,0.3>

		pigment { red 0 green 0.7 blue 1 }
	}

	// Right Fin
	sphere {
		0 0.03
		scale <1, 0.5, 0.15>
		rotate <0,-SideFinAngle,-15>
		translate <0,-0.02,0.03>

		pigment { Black }
	}

	// Left Fin
	sphere {
		0 0.03
		scale <1, 0.5, 0.15>
		rotate <0,SideFinAngle,-15>
		translate <0,-0.02,-0.03>

		pigment { Black }
	}

	// Tail Fin
	cone {
		<0.07, 0, 0>, 0.04, < 0, 0, 0>, 0.0001
		scale <1,1,0.3>
		rotate TailFinAngle*y
		translate <0.05,0,0>

		pigment { red 0 green 0.7 blue 1 }
	}

	finish { ShinyFinish }

	translate <0, 0.5, 0>
}


