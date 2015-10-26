
all: picture

picture:
	povray CSG-demo0.pov

scene:
	povray Aquable.pov

show: picture
	gqview CSG-demo0.png

movie:
	povray CSG-demo0.pov +KFI0 +KFF11
