settings.outformat="pdf";
settings.render=16;
import three;
import math;
import solids;
import settings;
size(1.55cm, 0);
currentprojection = perspective(-5,9,6);

real shrink = .01;

triple centering = (-.5,-.5,-.5);
real sphereScale = .5;
pen pathPen =  white+opacity(.4);
pen blockPen = red+opacity(1);
pen facePen = lightblue+opacity(1);

void draw4ToggleBlocks(pen blockPen){
	for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		draw(rotate(rotationAngle,Y)*shift(1,0,0)*scale3(sphereScale)*unitsphere, blockPen);
		draw(rotate(rotationAngle,Y)*shift(1,1,0)*scale3(sphereScale)*unitsphere, blockPen);
		draw(rotate(rotationAngle,Y)*shift(1,-1,0)*scale3(sphereScale)*unitsphere, blockPen);
	}
	draw(shift(0,-1,0)*scale3(sphereScale)*unitsphere, blockPen);
}

void draw4ToggleStructure(pen pathPen){
	for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		draw(rotate(rotationAngle,Y)*shift(1,0,0)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,1,0)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,2,0)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,-1,0)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,-2,0)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(2,-1,0)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(2,1,0)*shift(centering)*unitcube, pathPen);
	}
	draw(shift(0,1,0)*shift(centering)*unitcube, pathPen);
	draw(shift(0,-1,0)*shift(centering)*unitcube, pathPen);
}

// void draw4ToggleConnections(pen pathPen){
	// for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		// draw(rotate(rotationAngle,Y)*shift(1,0,0)*shift(centering)*unitcube, pathPen);
		// draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*shift(centering)*unitcube, pathPen);
		// draw(rotate(rotationAngle,Y)*shift(2,0,-1)*shift(centering)*unitcube, pathPen);
		// draw(rotate(rotationAngle,Y)*shift(2,1,-1)*shift(centering)*unitcube, pathPen);
	// }
// }

void draw4ToggleConnections(pen pathPen){
	for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		draw(rotate(rotationAngle,Y)*shift(1,0,-1)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,1,-1)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,2,-1)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,-1,-1)*shift(centering)*unitcube, pathPen);
		draw(rotate(rotationAngle,Y)*shift(1,-2,-1)*shift(centering)*unitcube, pathPen);
	}
}

// void draw4ToggleConnectionsPanels(pen facePen){
	// for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		// draw(rotate(rotationAngle,Y)*shift(3,1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(3,0,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(3,-1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		
		// draw(rotate(rotationAngle,Y)*shift(2,1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,0,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		
		// draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,0,-1)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,1,-1)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		
		// draw(rotate(rotationAngle,Y)*shift(2,-1,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,0,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,1,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		
		// // draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*rotate(90,X)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,1,-1)*rotate(90,X)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*rotate(-90,X)*shift(centering)*unitplane, facePen);
		// // draw(rotate(rotationAngle,Y)*shift(2,1,-1)*rotate(-90,X)*shift(centering)*unitplane, facePen);
	// }
// }

void draw4ToggleConnectionsPanels(pen facePen){
	for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		draw(rotate(rotationAngle,Y)*shift(2,1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,0,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,2,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,-2,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(1,1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,0,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-1,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,2,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-2,-1)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(1,-1,-1)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,0,-1)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,1,-1)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(1,-1,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,0,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,1,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-2,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,2,-2)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		
		// draw(rotate(rotationAngle,Y)*shift(2,-1,-1)*rotate(90,X)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,2,-1)*rotate(90,X)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-2,-1)*rotate(-90,X)*shift(centering)*unitplane, facePen);
		// draw(rotate(rotationAngle,Y)*shift(2,1,-1)*rotate(-90,X)*shift(centering)*unitplane, facePen);
	}
}

void draw4TogglePanels(pen facePen){
	for(int rotationAngle = 0; rotationAngle<360; rotationAngle += 90){
		//main loop
		draw(rotate(rotationAngle,Y)*shift(1,0,0)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-1,0)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-2,0)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,1,0)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,2,0)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(2,0,0)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,-2,0)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,2,0)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(1,0,0)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,-1,0)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,1,0)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		
		//protrusions
		draw(rotate(rotationAngle,Y)*shift(3,1,0)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(3,-1,0)*rotate(90,Y)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(2,-1,0)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,1,0)*rotate(180,Y)*shift(centering)*unitplane, facePen);
		
		draw(rotate(rotationAngle,Y)*shift(2,-1,0)*rotate(90,X)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,1,0)*rotate(90,X)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,-1,0)*rotate(-90,X)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(2,1,0)*rotate(-90,X)*shift(centering)*unitplane, facePen);
		
		//faces
		draw(rotate(rotationAngle,Y)*shift(1,-3,0)*rotate(90,X)*shift(centering)*unitplane, facePen);
		draw(rotate(rotationAngle,Y)*shift(1,2,0)*rotate(90,X)*shift(centering)*unitplane, facePen);
		
		
		
	}
	draw(shift(0,-3,0)*rotate(90,X)*shift(centering)*unitplane, facePen);
	draw(shift(0,2,0)*rotate(90,X)*shift(centering)*unitplane, facePen);
	
}

void draw4Toggle(pen pathPen, pen blockPen){
	currentprojection = perspective(-5,9,6);
	draw4ToggleStructure(pathPen);
	draw4ToggleConnections(pathPen);
	draw4ToggleBlocks(blockPen);
	draw4TogglePanels(facePen);
	draw4ToggleConnectionsPanels(facePen);
}

void draw4ToggleInside(pen pathPen, pen blockPen){
	currentprojection = perspective(-1.5,9,1.5);
	draw4ToggleStructure(pathPen);
	draw4ToggleConnections(pathPen);
	draw4ToggleBlocks(blockPen);
}

void draw4ToggleNoConnections(pen pathPen, pen blockPen){
	currentprojection = perspective(-5,9,6);
	draw4ToggleStructure(pathPen);
	draw4ToggleBlocks(blockPen);
	draw4TogglePanels(facePen);
}




//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  2D intersections  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
void drawGrid(int x, int y, int width, int startx, int starty) {
	for (int i = 0; i < x; ++i){
		for (int j = 0; j < y; ++j){
			draw((startx + i*width,starty + j*width)--(startx+ (i+1)*width,starty + j*width)--(startx+(i+1)*width,starty+(j+1)*width)--(startx + i*width,starty+(j+1)*width)--(startx + i*width,starty + j*width),lightgrey);}}
}

void drawSquare(int x, int y, pen c) {
	
	draw(scale(.9,.9,.9)*shift(x-0.5,y,0)*rotate(0,X)*shift(centering)*unitplane, c);
	//draw(rotate(180,Y)*shift(x,y,-0.5)*scale(1-shrink)*unitplane,c);
}

void drawRotateSquare(int x, int y, real angle, pen c) {
	
	draw(scale(.9,.9,.9)*rotate(angle,Y)*shift(x,y,-0.5)*shift(centering)*unitplane, c);
	//draw(rotate(90,Y)*shift(x,y-0.5,0)*scale(1-shrink)*unitplane,c);
}

void drawBlock(real x, real y, pen c){
	fill(Circle((x,y),.4),c);
}

void drawSquareRange(int x, int y, int numColumns, int numRows, pen c){
	for (int i = 0; i < numColumns; ++i){
		for (int j = 0; j < numRows; ++j){
			drawSquare(x+i, y-j, c);
		}
	}
}

void drawRotateSquareRange(int x, int y, real angle, int numColumns, int numRows, pen c){
	for (int i = 0; i < numColumns; ++i){
		for (int j = 0; j < numRows; ++j){
			drawRotateSquare(x+i, y-j, angle, c);
		}
	}
}

void draw2ToggleSquares(){
	drawGrid(5,5,1,0,0);
	for(int i=-1; i<6;++i){
		drawSquare(-1,i,black);
		drawSquare(5,i,black);
	}
	for(int i=-1; i<6;++i){
		drawSquare(i,-1,black);
		drawSquare(i,5,black);
	}
	drawSquare(2,2,black);
	drawSquare(2,4,black);
	drawSquare(2,5,black);
	drawSquare(4,2,black);
	drawSquare(4,4,black);
	drawSquare(0,0,black);
	drawSquare(0,4,black);
	drawSquare(4,0,black);
	drawSquare(0,2,black);
	drawSquare(2,0,black);
}


void draw2ToggleBlocks(){
drawBlock(1.5,1.5,red);
drawBlock(2.5,1.5,red);
drawBlock(3.5,1.5,red);
drawBlock(1.5,2.5,red);
drawBlock(1.5,3.5,red);
drawBlock(3.5,2.5,red);
drawBlock(3.5,3.5,red);
}
void draw2ToggleBBlocks(){
drawBlock(1.5,1.5,red);
drawBlock(3.5,1.5,red);
drawBlock(1.5,2.5,red);
drawBlock(1.5,3.5,red);
drawBlock(3.5,2.5,red);
drawBlock(3.5,3.5,red);
drawBlock(2.5,3.5,red);
}

void drawBroken2ToggleBlocks(){
drawBlock(2.5,3.5,red);
drawBlock(2.5,1.5,red);
drawBlock(3.5,1.5,red);
drawBlock(1.5,2.5,red);
drawBlock(1.5,1.5,red);
drawBlock(3.5,2.5,red);
drawBlock(3.5,3.5,red);
}




// draw4Toggle(pathPen, blockPen);
// shipout("4Toggle");
// erase();

// draw4ToggleNoConnections(pathPen, blockPen);
// shipout("4ToggleNoConnections");
// erase();

// draw4ToggleInside(pathPen, blockPen);
// shipout("4ToggleBasic");
// erase();

// drawRotateSquareRange(0,0,0,5,5,red);
// drawRotateSquareRange(0,0,90,5,5,black);
//drawSquare(0,0,blue);


