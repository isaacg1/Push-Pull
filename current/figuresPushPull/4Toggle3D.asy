import three;
import style;
import sheet;
import cube;


currentprojection = perspective(100 * (4.1, -7.5, 2.9));
//currentprojection = orthographic(100 * (4.1, -7.5, 2.9));
// currentprojection = orthographic(camera = +Z, up = -X);
// currentprojection = orthographic(camera = +X, up = +Z);


void drawAxes(triple position) {
	path3[] axes;

	axes.push(position -- (position + X));
	axes.push(position -- (position + Y));
	axes.push(position -- (position + Z));

	contents con;
	for (int i = 0; i < axes.length; ++i) {
		con.addLine(line(axes[i], penLine, 0.05, false, true));
	}

	label("$x$", position + X, unit(project(X)));
	label("$y$", position + Y, unit(project(Y)));
	label("$z$", position + Z, unit(project(Z)));

	// extremely hacky
	dividers = false;
	con.draw(flat);
	dividers = true;

	draw(shift(position) * scale3(0.05) * unitsphere, penLine);
}

void drawCubes(
	real x, real y, real z, real h, real w, real l, real cubeSize = 1, bool arrows = false,
	bool wiggles = false, bool scored = false
) {
	contents con;
	triple curr = (0,0,0);

	triple cubeOffset = 0.5 * cubeSize * (1, 1, 1);
	
	for (real i = x; i < x+l; ++i){
		for (real j = x; j < y+w; ++j){
			for (real k = x; k < z+h; ++k){
				curr = (i,j,k);
				makeCube(
				con, curr - cubeOffset, curr + cubeOffset,
				gray + opacity(0.025),
				scoreCount = 3, scoreColor = black + opacity(0.05)
			);
			}
		}
	}

	//con.addLine(line(p, penLine, size, arrows, arrows));
	con.draw(flat);
}

void drawBlocks(){
	contents con;
	triple curr = (0,0,0);

	triple cubeOffset = 0.5 * 1 * (1, 1, 1);
	
	for (real i = 5; i < 8; ++i){
		for (real j = 5; j < 8; ++j){
			for (real k = 5; k < 8; ++k){
				//curr = (i,j,k);
				draw(shift(.5*i,.5*j,.5*k)*scale(.5,.5,.5)*unitsphere,red);
				//sphere(
				//con, curr - cubeOffset, curr + cubeOffset,
				//gray + opacity(0.25),
				//scoreCount = 3, scoreColor = black + opacity(0.05)
			//);
			}
		}
	}

	//con.addLine(line(p, penLine, size, arrows, arrows));
	con.draw(flat);
}


drawAxes((-2, -4, -1));
drawCubes(0,0,0,5,5,5);
drawBlocks();

zshipout("4Toggle3D");
erase();