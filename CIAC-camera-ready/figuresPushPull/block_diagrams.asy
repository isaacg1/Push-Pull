size(5cm,0);
import math;
import solids;
import settings;
import graph;
outformat="pdf";

defaultpen(1);
real shrink = .015;

void drawGrid(int x, int y, int width, int startx, int starty) {
	for (int i = 0; i < x; ++i){
		for (int j = 0; j < y; ++j){
			draw((startx + i*width,starty + j*width)--(startx+ (i+1)*width,starty + j*width)--(startx+(i+1)*width,starty+(j+1)*width)--(startx + i*width,starty+(j+1)*width)--(startx + i*width,starty + j*width),lightgrey);}}
}

void drawSquare(int x, int y, pen c) {
	fill(box((x+shrink,y+shrink),(x+1-shrink,y+1-shrink)),c);
}

void drawBlock(real x, real y, pen c){
	//fill(Circle((x,y),.4),c);
	fill(box((x-.4,y-.4),(x+.4,y+.4)),c);
}

void drawElipsis(real x, real y, pen c){
	fill(Circle((x-.21,y-.2),.09),c);
	fill(Circle((x,y-.2),.09),c);
	fill(Circle((x+.21,y-.2),.09),c);
}

void drawSquareRange(int x, int y, int numColumns, int numRows, pen c){
for (int i = 0; i < numColumns; ++i){
	for (int j = 0; j < numRows; ++j){
		drawSquare(x+i, y-j, c);
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

void draw2ToggleArrows(){
	
draw((0.3,1.7)--(0.1,1.9),EndArrow);
draw((0.3,3.7)--(0.1,3.9),EndArrow);
draw((4.7,1.7)--(4.9,1.9),EndArrow);
draw((4.7,3.7)--(4.9,3.9),EndArrow);
}
void draw2ToggleLabels(){
label("$1d$",(0.5,1.5), blue+fontsize(7pt));
label("$1a$",(0.5,3.5), blue+fontsize(7pt));
label("$1c$",(1.5,0.5), blue+fontsize(7pt));
label("$1b$",(1.5,4.5), blue+fontsize(7pt));

label("$2d$",(4.5,1.5), blue+fontsize(7pt));
label("$2a$",(4.5,3.5), blue+fontsize(7pt));
label("$2c$",(3.5,0.5), blue+fontsize(7pt));
label("$2b$",(3.5,4.5), blue+fontsize(7pt));
}

void draw2TogglePathA(){
//draw((2.75,4.75)--(3.25,4.75)--(3.25,6.5)--(0.5,6.5)--(0.5,0.5)--(3.25,0.5)--(3.25,2.25)--(2.75,2.25), blue, MidArrow);
draw((1.5,3.5)--(2.25,3.5), blue, EndArrow);
draw((1.5,2.5)--(1.5,3.25), blue, EndArrow);
draw((1.5,1.5)--(1.5,2.25), blue, EndArrow);
draw((2.5,1.5)--(1.75,1.5), blue, EndArrow);
}

void draw2Toggle(){
draw2ToggleSquares();
draw2ToggleBlocks();
draw2ToggleLabels();
draw2ToggleArrows();
}

void draw2ToggleB(){
draw2ToggleSquares();
draw2ToggleBBlocks();
draw2ToggleLabels();
}

void drawBroken2Toggle(){
draw2ToggleSquares();
drawBroken2ToggleBlocks();
draw2ToggleLabels();
}

//#####################################################################


void draw2ToggleSquaresK(){
	drawGrid(7,7,1,0,0);
	for(int i=-1; i<8;++i){
		drawSquare(-1,i,black);
		drawSquare(7,i,black);
	}
	for(int i=-1; i<8;++i){
		drawSquare(i,-1,black);
		drawSquare(i,7,black);
	}
	for(int i=2; i<5;++i){
		for(int j=2; j<5;++j){
			drawSquare(i,j,black);
			drawSquare(i,j,black);
		}
	}

	drawSquare(0,2,black);
	drawSquare(0,3,black);
	drawSquare(0,4,black);
	drawSquare(0,6,black);
	drawSquare(2,0,black);
	drawSquare(2,2,black);
	drawSquare(2,4,black);
	drawSquare(2,6,black);
	drawSquare(3,0,black);
	drawSquare(3,6,black);
	drawSquare(4,0,black);
	drawSquare(4,2,black);
	drawSquare(4,4,black);
	drawSquare(4,6,black);
	drawSquare(0,0,black);
	drawSquare(0,2,black);
	drawSquare(0,3,black);
	drawSquare(0,4,black);
	drawSquare(0,6,black);
	drawSquare(2,6,black);
	drawSquare(3,6,black);
	drawSquare(4,6,black);
	drawSquare(6,0,black);
	drawSquare(6,2,black);
	drawSquare(6,3,black);
	drawSquare(6,4,black);
	drawSquare(6,6,black);
}



void draw2ToggleBlocksK(){

	drawBlock(1.5,1.5,red);
	drawBlock(1.5,2.5,red);
	drawBlock(1.5,4.5,red);
	drawBlock(1.5,5.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(5.5,1.5,red);
	drawBlock(5.5,2.5,red);
	drawBlock(5.5,4.5,red);
	drawBlock(5.5,5.5,red);
	drawBlock(4.5,1.5,red);
	drawBlock(2.5,1.5,red);
	drawBlock(1.5,4.5,red);
	drawBlock(4.5,5.5,red);


	drawElipsis(1.5,3.5,black);
	drawElipsis(5.5,3.5,black);
	drawElipsis(3.5,1.5,black);
	drawElipsis(3.5,5.5,black);	
}


void draw2ToggleLabelsK(){
label("$1a$",(0.5,5.5), blue+fontsize(7pt));
draw((0.3,5.7)--(0.1,5.9),EndArrow);
label("$1b$",(1.5,6.5), blue+fontsize(7pt));
label("$1d$",(0.5,1.5), blue+fontsize(7pt));
draw((0.3,1.7)--(0.1,1.9),EndArrow);
label("$1c$",(1.5,0.5), blue+fontsize(7pt));

label("$2a$",(6.5,5.5), blue+fontsize(7pt));
draw((6.7,5.7)--(6.9,5.9),EndArrow);
label("$2b$",(5.5,6.5), blue+fontsize(7pt));
label("$2d$",(6.5,1.5), blue+fontsize(7pt));
draw((6.7,1.7)--(6.9,1.9),EndArrow);
label("$2c$",(5.5,0.5), blue+fontsize(7pt));
}

void draw2TogglePathAK(){
draw((2.75,4.75)--(3.25,4.75)--(3.25,6.5)--(0.5,6.5)--(0.5,0.5)--(3.25,0.5)--(3.25,2.25)--(2.75,2.25), blue, MidArrow);
draw((3.5,4.5)--(4.25,4.5), pink, EndArrow);
draw((3.5,3.5)--(3.5,4.25), pink, EndArrow);
draw((3.5,2.5)--(3.5,3.25), pink, EndArrow);
draw((4.5,2.5)--(3.75,2.5), pink, EndArrow);
}

void draw2ToggleK(){
draw2ToggleSquaresK();
draw2ToggleBlocksK();
draw2ToggleLabelsK();
}

//#####################################################################

void drawReversibleOneWay(){
drawGrid(5, 5, 1, 0, 0);
drawSquare(0,0,black);
drawSquare(1,0,black);
drawSquare(0,1,black);
drawSquare(3,0,black);
drawSquare(4,0,black);
drawSquare(0,3,black);
drawSquare(0,4,black);
drawSquare(1,4,black);
drawSquare(2,4,black);
drawSquare(3,4,black);
drawSquare(4,4,black);
drawSquare(4,3,black);
drawSquare(4,2,black);
drawSquare(4,1,black);
drawSquare(4,0,black);
drawSquare(2,2,black);

drawBlock(2.5,1.5,red);
drawBlock(1.5,1.5,red);
}

//##########################################################################

void drawSetVerifySquares(){
drawGrid(6,7,1,0,0);
drawSquare(0,0,black);
drawSquare(0,1,black);
drawSquare(0,2,black);
drawSquare(0,3,black);
drawSquare(0,5,black);
drawSquare(0,6,black);
drawSquare(1,3,black);
drawSquare(0,3,black);
drawSquare(2,0,black);
drawSquare(2,6,black);
drawSquare(3,0,black);
drawSquare(3,6,black);
drawSquare(3,2,black);
drawSquare(4,0,black);
drawSquare(5,0,black);
drawSquare(5,1,black);
drawSquare(5,2,black);
drawSquare(5,3,black);
drawSquare(5,4,black);
drawSquare(5,5,black);
drawSquare(5,6,black);
}

void drawSetVerifyBlocksUnset(){
drawBlock(2.5,2.5,red);
label("$4$",(2.5,2.5), black);
drawBlock(2.5,3.5,red);
label("$3$",(2.5,3.5), black);
drawBlock(2.5,5.5,red);
label("$1$",(2.5,5.5), black);
drawBlock(3.5,5.5,red);
label("$2$",(3.5,5.5), black);
}

void drawSetVerifyBlocksSet(){
drawBlock(3.5,3.5,red);
label("$3$",(3.5,3.5), black);
drawBlock(2.5,3.5,red);
label("$4$",(2.5,3.5), black);
drawBlock(2.5,5.5,red);
label("$1$",(2.5,5.5), black);
drawBlock(3.5,4.5,red);
label("$2$",(3.5,4.5), black);
}

void drawSetVerifyBlocksVerified(){
drawBlock(3.5,3.5,red);
label("$3$",(3.5,3.5), black);
drawBlock(2.5,3.5,red);
label("$4$",(2.5,3.5), black);
drawBlock(3.5,5.5,red);
label("$1$",(3.5,5.5), black);
drawBlock(3.5,4.5,red);
label("$2$",(3.5,4.5), black);
}

void drawSetVerifyWalls(){
pen wallPen = black+linewidth(1.5pt);
draw((2,1)--(2,2), wallPen);
draw((2,4)--(3,4), wallPen);
draw((3,4)--(3,5), wallPen);
draw((4,4)--(5,4), wallPen);
draw((4,5)--(4,7), wallPen);
draw((1,5)--(2,5), wallPen);
//draw((3,6)--(4,6), wallPen);
}

void drawSetVerifyLabels(){
label("$S_o$",(1.5,0.5), blue+fontsize(7pt));
label("$S_i$",(4.5,6.5), blue+fontsize(7pt));
label("$V_o$",(0.5,4.5), blue+fontsize(7pt));
label("$V_i$",(1.5,6.5), blue+fontsize(7pt));
}

void drawSetVerifyOutline(){
	drawSetVerifySquares();
drawSetVerifyWalls();
drawSetVerifyLabels();
}

void drawSetVerifyUnset(){
drawSetVerifySquares();
drawSetVerifyBlocksUnset();
drawSetVerifyWalls();
drawSetVerifyLabels();
}

void drawSetVerifySet(){
drawSetVerifySquares();
drawSetVerifyBlocksSet();
drawSetVerifyWalls();
drawSetVerifyLabels();
}


void drawSetVerifyVerified(){
drawSetVerifySquares();
drawSetVerifyBlocksVerified();
drawSetVerifyWalls();
drawSetVerifyLabels();
}


//##########################################################################

void drawSetVerifySquares3D(){
drawGrid(6,8,1,0,0);
drawSquare(0,0,black);
drawSquare(0,1,black);
drawSquare(0,2,black);
drawSquare(0,3,black);
drawSquare(0,4,black);
drawSquare(0,5,black);
drawSquare(0,6,black);
drawSquare(0,7,black);
drawSquare(1,0,black);
drawSquare(1,1,black);
drawSquare(1,3,black);
drawSquare(1,4,black);
drawSquare(1,6,black);
drawSquare(1,7,black);
drawSquare(2,0,black);
drawSquare(2,4,black);
drawSquare(2,7,black);
drawSquare(3,0,black);
drawSquare(3,6,black);
drawSquare(3,7,black);
drawSquare(4,0,black);
drawSquare(4,6,black);
drawSquare(4,7,black);
drawSquare(3,2,black);
drawSquare(4,4,black);
drawSquare(4,5,black);
drawSquare(5,0,black);
drawSquare(5,6,black);
drawSquare(5,1,black);
drawSquare(5,2,black);
drawSquare(5,3,black);
drawSquare(5,4,black);
drawSquare(5,5,black);
drawSquare(5,7,black);
}

void drawSetVerifyBlocks3D(){
drawSetVerifyBlocksUnset();
}

void drawSetVerifyLabels3D(){
	label("$S_o$",(1.5,2.5), blue+fontsize(7pt));
	draw((1.3,2.7)--(1.1,2.9),EndArrow);
	label("$S_i$",(3.5,4.5), blue+fontsize(7pt));
	draw((3.3,4.7)--(3.1,4.9),EndArrow);
	label("$V_o$",(2.5,6.5), blue+fontsize(7pt));
	draw((2.3,6.7)--(2.1,6.9),EndArrow);
	label("$V_i$",(1.5,5.5), blue+fontsize(7pt));
	draw((1.3,5.7)--(1.1,5.9),EndArrow);
}

void drawSetVerify3D(){
drawSetVerifySquares3D();
drawSetVerifyBlocks3D();
drawSetVerifyLabels3D();
}

//##########################################################################

void drawCrossoverDestructiveSquares(){
drawSquareRange(0,8,3,4,black);
drawSquareRange(0,8,1,7,black);
drawSquareRange(0,0,12,1,black);
drawSquareRange(3,6,1,2,black);
drawSquareRange(3,1,6,1,black);
drawSquareRange(4,2,4,1,black);
drawSquareRange(5,3,2,1,black);
drawSquareRange(4,8,3,1,black);
drawSquareRange(7,6,1,2,black);
drawSquareRange(0,8,3,4,black);
drawSquareRange(8,8,3,4,black);
drawSquareRange(11,8,1,7,black);
drawSquare(5,6,black);
drawSquare(2,3,black);
drawSquare(9,3,black);
}

void drawCrossoverDestructiveBlocks(){
drawBlock(4.5,7.5,red);
drawBlock(4.5,6.5,red);
drawBlock(6.5,7.5,red);
drawBlock(6.5,6.5,red);
drawBlock(2.5,2.5,red);
drawBlock(3.5,2.5,red);
drawBlock(8.5,2.5,red);
drawBlock(9.5,2.5,red);
}

void drawCrossoverDestructiveWalls(){
pen wallPen = black+linewidth(2.5pt);
draw((4,5)--(4,4), wallPen);
draw((5,6)--(5,5), wallPen);
draw((6,5)--(6,4), wallPen);
draw((8,5)--(8,4), wallPen);
draw((1,2)--(2,2), wallPen);
draw((10,2)--(11,2), wallPen);
}

void drawCrossoverDestructiveLabels(){
label("$1a$",(3.5,8.5), blue+fontsize(7pt));
label("$1b$",(11.5,1.5), blue+fontsize(7pt));
label("$2a$",(7.5,8.5), blue+fontsize(7pt));
label("$2b$",(0.5,1.5), blue+fontsize(7pt));
}


void drawCrossoverDestructive(){
drawGrid(12,9,1,0,0);
drawCrossoverDestructiveSquares();
drawCrossoverDestructiveBlocks();
drawCrossoverDestructiveWalls();
drawCrossoverDestructiveLabels();
}

//##########################################################################

void drawCrossoverInorderSquares(){
drawSquareRange(0,16,1,17,black);
drawSquareRange(2,0,7,1,black);
drawSquareRange(1,16,1,7,black);
drawSquareRange(3,16,6,1,black);
drawSquareRange(3,15,2,1,black);
drawSquareRange(2,2,2,2,black);
drawSquareRange(7,11,2,10,black);
drawSquareRange(6,8,1,4,black);
drawSquareRange(8,16,1,4,black);
drawSquare(3,1,black);
drawSquare(5,3,black);
drawSquare(4,7,black);
drawSquare(2,6,black);
drawSquare(3,11,black);
drawSquare(5,10,black);
drawSquare(6,14,black);
drawSquare(5,5,black);
}

void drawCrossoverInorderBlocks(){
drawBlock(2.5,3.5,red);
drawBlock(3.5,3.5,red);
drawBlock(4.5,3.5,red);
drawBlock(4.5,2.5,red);
drawBlock(3.5,6.5,red);
drawBlock(3.5,7.5,red);
drawBlock(3.5,13.5,red);
drawBlock(3.5,14.5,red);
drawBlock(5.5,13.5,red);
drawBlock(6.5,13.5,red);
drawBlock(4.5,11.5,red);
drawBlock(5.5,11.5,red);
}

void drawCrossoverInorderWalls(){
	pen wallPen = black+linewidth(3pt);
	draw((2,3)--(2,4), wallPen);
	draw((1,5)--(2,5), wallPen);
	draw((3,4)--(3,6), wallPen);
	draw((3,6)--(4,6), wallPen);
	draw((6,2)--(7,2), wallPen);
	draw((4,4)--(4,5), wallPen);
	draw((4,5)--(5,5), wallPen);
	draw((2,7)--(2,9), wallPen);
	draw((3,9)--(6,9), wallPen);
	draw((3,8)--(3,9), wallPen);
	draw((3,4)--(3,6), wallPen);
	draw((4,9)--(4,10), wallPen);
	draw((3,10)--(3,11), wallPen);
	draw((4,12)--(5,12), wallPen);
	draw((4,12)--(4,14), wallPen);
	draw((3,14)--(3,15), wallPen);
	draw((2,13)--(3,13), wallPen);
	draw((5,13)--(5,14), wallPen);
	draw((5,13)--(6,13), wallPen);
	draw((6,12)--(7,12), wallPen);
	draw((6,12)--(6,13), wallPen);
	draw((7,13)--(8,13), wallPen);
}

void drawCrossoverInorderLabels(){
	label("$1a$",(2.5,16.5), blue+fontsize(7pt));
	label("$1b$",(1.5,0.5), blue+fontsize(7pt));
	label("$2a$",(8.5,1.5), blue+fontsize(7pt));
	label("$2b$",(8.5,12.5), blue+fontsize(7pt));
}

void drawCrossoverInorder(){
	drawGrid(9,17,1,0,0);
	drawCrossoverInorderSquares();
	drawCrossoverInorderBlocks();
	drawCrossoverInorderWalls();
	drawCrossoverInorderLabels();
}

void drawSmily(real x, real y){
	picture smiley;
	filldraw(smiley,Circle((0,0),1),yellow,black);
	fill(smiley,Circle((-.3,.4),.1),black);
	fill(smiley,Circle((.3,.4),.1),black);
	draw(smiley,Arc((0,0),.5,-140,-40));
	add(scale(.32cm)*smiley,(x,y));
}

void drawAnimatedSetVerifyS(){
	
	drawSetVerifyOutline();
	drawSetVerifyBlocksUnset();
	layer();
	drawSmily(4.5,6.5);
	shipout("SetVerifyUnsetAnimated1");
	erase();
	
	drawSetVerifyOutline();
	drawSetVerifyBlocksUnset();
	layer();
	drawSmily(4.5,5.5);
	shipout("SetVerifyUnsetAnimated2");
	erase();
	
	drawSetVerifyOutline();
	drawSetVerifyBlocksUnset();
	layer();
	drawSmily(4.5,4.5);
	shipout("SetVerifyUnsetAnimated3");
	erase();
	
	drawSetVerifyOutline();
	drawSetVerifyBlocksUnset();
	layer();
	drawSmily(3.5,4.5);
	shipout("SetVerifyUnsetAnimated4");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,2.5,red);
	drawBlock(2.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(3.5,3.5);
	shipout("SetVerifyUnsetAnimated5");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,2.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(4.5,3.5);
	shipout("SetVerifyUnsetAnimated6");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,2.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(4.5,2.5);
	shipout("SetVerifyUnsetAnimated7");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,2.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(4.5,1.5);
	shipout("SetVerifyUnsetAnimated8");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,2.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(3.5,1.5);
	shipout("SetVerifyUnsetAnimated9");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,2.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(2.5,1.5);
	shipout("SetVerifyUnsetAnimated10");
	erase();
	
	drawSetVerifyOutline();
	drawBlock(2.5,3.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(2.5,5.5,red);
	drawBlock(3.5,4.5,red);
	layer();
	drawSmily(2.5,2.5);
	shipout("SetVerifyUnsetAnimated11");
	erase();
	
	drawSetVerifySet();
	layer();
	drawSmily(1.5,2.5);
	shipout("SetVerifyUnsetAnimated12");
	erase();
	
			drawSetVerifySet();
			layer();
	drawSmily(1.5,1.5);
	shipout("SetVerifyUnsetAnimated13");
	erase();
	
			drawSetVerifySet();
			layer();
	drawSmily(1.5,0.5);
	shipout("SetVerifyUnsetAnimated14");
	erase();
	
}

void drawAnimatedSetVerifyV(){
	
	drawSetVerifyOutline();
	drawSetVerifyBlocksSet();
	layer();
	drawSmily(1.5,6.5);
	shipout("SetVerifyVerifiedAnimated1");
	erase();
	
		drawSetVerifyOutline();
	drawSetVerifyBlocksSet();
	layer();
	drawSmily(1.5,5.5);
	shipout("SetVerifyVerifiedAnimated2");
	erase();
	
		drawSetVerifyOutline();
	drawSetVerifyBlocksVerified();
	layer();
	drawSmily(2.5,5.5);
	shipout("SetVerifyVerifiedAnimated3");
	erase();
	
		drawSetVerifyOutline();
	drawSetVerifyBlocksVerified();
	layer();
	drawSmily(2.5,4.5);
	shipout("SetVerifyVerifiedAnimated4");
	erase();
	
		drawSetVerifyOutline();
	drawSetVerifyBlocksVerified();
	layer();
	drawSmily(1.5,4.5);
	shipout("SetVerifyVerifiedAnimated5");
	erase();
	
		drawSetVerifyOutline();
	drawSetVerifyBlocksVerified();
	layer();
	drawSmily(0.5,4.5);
	shipout("SetVerifyVerifiedAnimated6");
	erase();
}

//  #######################################################################
void drawAnimated2Toggle(){
	
	draw2ToggleSquares();
	draw2ToggleBlocks();
	draw2ToggleLabels();
	layer();
	drawSmily(0.5,3.5);	
	shipout("2ToggleAnimated1");
	erase();
	
	
	draw2ToggleSquares();
	drawBroken2ToggleBlocks();
	draw2ToggleLabels();
	layer();
	drawSmily(1.5,3.5);	
	shipout("2ToggleAnimated2");
	erase();
	
	draw2ToggleSquares();
	drawBlock(1.5,1.5,red);
	drawBlock(2.5,1.5,red);
	drawBlock(3.5,1.5,red);
	drawBlock(2.5,3.5,red);
	drawBlock(1.5,3.5,red);
	drawBlock(3.5,2.5,red);
	drawBlock(3.5,3.5,red);		
	draw2ToggleLabels();
	layer();
	drawSmily(1.5,4.5);	
	shipout("2ToggleAnimated3");
	erase();
	
	draw2ToggleSquares();
	drawBlock(1.5,1.5,red);
	drawBlock(2.5,1.5,red);
	drawBlock(3.5,1.5,red);
	drawBlock(2.5,3.5,red);
	drawBlock(1.5,3.5,red);
	drawBlock(3.5,2.5,red);
	drawBlock(3.5,3.5,red);		
	draw2ToggleLabels();
	layer();
	drawSmily(1.5,0.5);	
	shipout("2ToggleAnimated4");
	erase();
	
	draw2ToggleSquares();
	drawBlock(1.5,2.5,red);
	drawBlock(2.5,1.5,red);
	drawBlock(3.5,1.5,red);
	drawBlock(2.5,3.5,red);
	drawBlock(1.5,3.5,red);
	drawBlock(3.5,2.5,red);
	drawBlock(3.5,3.5,red);		
	draw2ToggleLabels();
	layer();
	drawSmily(1.5,1.5);	
	shipout("2ToggleAnimated5");
	erase();
	
	draw2ToggleSquares();
	drawBlock(1.5,2.5,red);
	drawBlock(1.5,1.5,red);
	drawBlock(3.5,1.5,red);
	drawBlock(2.5,3.5,red);
	drawBlock(1.5,3.5,red);
	drawBlock(3.5,2.5,red);
	drawBlock(3.5,3.5,red);		
	draw2ToggleLabels();
	layer();
	drawSmily(0.5,1.5);	
	shipout("2ToggleAnimated6");
	erase();
	
}

void drawExampleSquares(){
drawGrid(6,7,1,0,0);
for(int i=-1; i<6;++i){
	drawSquare(-1,i,black);
	drawSquare(5,i,black);
}
for(int i=-1; i<6;++i){
	drawSquare(i,-1,black);
	drawSquare(i,6,black);
}

}


void drawExampleBlocks(){
drawBlock(0.5,4.5,red);
drawBlock(1.5,4.5,red);
drawBlock(3.5,4.5,red);
drawBlock(4.5,4.5,red);

drawBlock(1.5,3.5,red);
drawBlock(2.5,3.5,red);
drawBlock(3.5,3.5,red);

drawBlock(0.5,2.5,red);
drawBlock(4.5,2.5,red);

drawBlock(1.5,1.5,red);
drawBlock(2.5,1.5,red);
drawBlock(3.5,1.5,red);

}

void drawStar(real xoffset, real yoffset){
	path star;
	star=expi(0)--(scale((3-sqrt(5))/2)*expi(pi/5))--expi(2*pi/5)--
     (scale((3-sqrt(5))/2)*expi(3*pi/5))--expi(4pi/5)--
     (scale((3-sqrt(5))/2)*expi(5*pi/5))--expi(6*pi/5)--
     (scale((3-sqrt(5))/2)*expi(7*pi/5))--expi(8*pi/5)--
     (scale((3-sqrt(5))/2)*expi(9*pi/5))--cycle;
	
	fill(shift(xoffset,yoffset)*scale(.4)*rotate(18)*star, yellow);
	draw(shift(xoffset,yoffset)*scale(.4)*rotate(18)*star);
}

void drawSamplePuzzleWalls(){
pen wallPen = black+linewidth(1.5pt);
draw((2,2)--(3,2), wallPen);
draw((2,3)--(3,3), wallPen);
draw((1,4)--(1,6), wallPen);
draw((4,3)--(4,4), wallPen);
//draw((3,6)--(4,6), wallPen);
}

void drawSamplePuzzle(){
	drawExampleSquares();
	drawExampleBlocks();
	drawSamplePuzzleWalls();
	drawSmily(2.5,0.5);	
	drawStar(2.5,5.45);
	
}


void drawExampleSquares2(){
drawGrid(4,5,1,0,0);
for(int i=-1; i<4;++i){
	drawSquare(-1,i,black);
	drawSquare(3,i,black);
}
for(int i=-1; i<4;++i){
	drawSquare(i,-1,black);
	drawSquare(i,4,black);
}

}


void drawExampleBlocks2(){
drawBlock(0.5,1.5,red);
drawBlock(0.5,2.5,red);
drawBlock(0.5,3.5,red);
}

void drawExampleBlocksAnimated1(){
drawBlock(1.5,1.5,red);
drawBlock(0.5,2.5,red);
drawBlock(0.5,3.5,red);
}

void drawExampleBlocksAnimated2(){
drawBlock(1.5,1.5,red);
drawBlock(1.5,2.5,red);
drawBlock(0.5,3.5,red);
}

void drawExampleBlocksAnimated3(){
drawBlock(1.5,1.5,red);
drawBlock(2.5,2.5,red);
drawBlock(0.5,3.5,red);
}

void drawExampleBlocksAnimated4(){
drawBlock(1.5,0.5,red);
drawBlock(2.5,2.5,red);
drawBlock(0.5,3.5,red);
}

void drawExampleBlocksAnimated5(){
drawBlock(1.5,0.5,red);
drawBlock(2.5,2.5,red);
drawBlock(0.5,2.5,red);
}

void drawExampleBlocksAnimated6(){
drawBlock(1.5,0.5,red);
drawBlock(2.5,2.5,red);
drawBlock(0.5,1.5,red);
}

void drawExampleBlocksAnimated7(){
drawBlock(2.5,0.5,red);
drawBlock(2.5,2.5,red);
drawBlock(0.5,1.5,red);
}

void drawSamplePuzzleWalls2(){
pen wallPen = black+linewidth(1.5pt);
draw((1,3)--(3,3), wallPen);
}

void drawSamplePuzzle2(){
	drawExampleSquares2();
	drawExampleBlocks2();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,1.5);	
	drawStar(1.5,3.45);
	
}

void drawSamplePuzzleAnimated(){
	drawSamplePuzzle2();
	shipout("SamplePuzzleAnimated1");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated1();
	drawSamplePuzzleWalls2();
	drawSmily(2.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated2");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated1();
	drawSamplePuzzleWalls2();
	drawSmily(2.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated3");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated1();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated4");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(2.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated5");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(2.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated6");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(2.5,0.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated7");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,0.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated8");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,0.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated9");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated10");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated2();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated105");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated3();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated11");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated4();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated12");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated4();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated13");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated4();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated14");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated5();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated15");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated6();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,0.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated16");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated7();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,0.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated17");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated7();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,1.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated18");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated7();
	drawSamplePuzzleWalls2();
	drawSmily(1.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated19");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated7();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,2.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated20");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated7();
	drawSamplePuzzleWalls2();
	drawSmily(0.5,3.5);	
	drawStar(1.5,3.45);
	shipout("SamplePuzzleAnimated21");
	erase();
	
	drawExampleSquares2();
	drawExampleBlocksAnimated7();
	drawSamplePuzzleWalls2();
	drawStar(1.5,3.45);
	drawSmily(1.5,3.5);	
	shipout("SamplePuzzleAnimated22");
	erase();
}

// draw2Toggle();
// draw2TogglePathA();
// shipout("2Toggle");
// erase();

// draw2Toggle();
// shipout("2ToggleA");
// erase();

// draw2ToggleB();
// shipout("2ToggleB");
// erase();

// drawBroken2Toggle();
// shipout("broken2Toggle");
// erase();	

// draw2ToggleK();
// shipout("2ToggleK");
// erase();

drawSetVerifyUnset();
shipout("SetVerifyUnset");
erase();

drawSetVerifySet();
shipout("SetVerifySet");
erase();

drawSetVerifyVerified();
shipout("SetVerifyVerified");
erase();

// drawSetVerify3D();
// shipout("SetVerify3D");
// erase();

// drawAnimatedSetVerifyS();
// drawAnimatedSetVerifyV();
// drawAnimated2Toggle();

// drawSamplePuzzle2();
// shipout("ExamplePuzzle");
// erase();

// drawSamplePuzzleAnimated();

