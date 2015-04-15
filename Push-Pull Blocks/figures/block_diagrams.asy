size(5cm,0);
import math;
import solids;
import settings;
outformat="pdf";

defaultpen(1);
real shrink = .01;

void drawGrid(int x, int y, int width, int startx, int starty) {
	for (int i = 0; i < x; ++i){
		for (int j = 0; j < y; ++j){
			draw((startx + i*width,starty + j*width)--(startx+ (i+1)*width,starty + j*width)--(startx+(i+1)*width,starty+(j+1)*width)--(startx + i*width,starty+(j+1)*width)--(startx + i*width,starty + j*width),grey);}}
}

void drawSquare(int x, int y, pen c) {
	fill(box((x+shrink,y+shrink),(x+1-shrink,y+1-shrink)),c);
}

void drawBlock(real x, real y, pen c){
	fill(Circle((x,y),.4),c);
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
drawGrid(9,7,1,0,0);
for(int i=-1; i<8;++i){
	drawSquare(-1,i,black);
	drawSquare(9,i,black);
}
for(int i=-1; i<10;++i){
	drawSquare(i,-1,black);
	drawSquare(i,7,black);
}
drawSquare(1,1,black);
drawSquare(1,2,black);
drawSquare(1,3,black);
drawSquare(1,4,black);
drawSquare(1,5,black);
drawSquare(2,1,black);
drawSquare(2,3,black);
drawSquare(2,5,black);
drawSquare(4,0,black);
drawSquare(4,1,black);
drawSquare(4,3,black);
drawSquare(4,5,black);
drawSquare(4,6,black);
drawSquare(6,1,black);
drawSquare(6,3,black);
drawSquare(6,5,black);
drawSquare(7,1,black);
drawSquare(7,2,black);
drawSquare(7,3,black);
drawSquare(7,4,black);
drawSquare(7,5,black);
}

void draw2ToggleBlocks(){
drawBlock(3.5,2.5,red);
drawBlock(4.5,2.5,red);
drawBlock(5.5,2.5,red);
drawBlock(3.5,3.5,red);
drawBlock(3.5,4.5,red);
drawBlock(5.5,3.5,red);
drawBlock(5.5,4.5,red);
}

void drawBroken2ToggleBlocks(){
drawBlock(4.5,4.5,red);
drawBlock(4.5,2.5,red);
drawBlock(5.5,2.5,red);
drawBlock(3.5,3.5,red);
drawBlock(3.5,2.5,red);
drawBlock(5.5,3.5,red);
drawBlock(5.5,4.5,red);
}


void draw2ToggleLabels(){
label("1b",(2.5,2.5), blue+fontsize(7pt));
label("1a",(2.5,4.5), blue+fontsize(7pt));
label("2b",(6.5,2.5), blue+fontsize(7pt));
label("2a",(6.5,4.5), blue+fontsize(7pt));
}

void draw2TogglePathA(){
draw((2.75,4.75)--(3.25,4.75)--(3.25,6.5)--(0.5,6.5)--(0.5,0.5)--(3.25,0.5)--(3.25,2.25)--(2.75,2.25), blue, MidArrow);
draw((3.5,4.5)--(4.25,4.5), pink, EndArrow);
draw((3.5,3.5)--(3.5,4.25), pink, EndArrow);
draw((3.5,2.5)--(3.5,3.25), pink, EndArrow);
draw((4.5,2.5)--(3.75,2.5), pink, EndArrow);
}

void draw2Toggle(){
draw2ToggleSquares();
draw2ToggleBlocks();
draw2ToggleLabels();
}

void drawBroken2Toggle(){
draw2ToggleSquares();
drawBroken2ToggleBlocks();
draw2ToggleLabels();
}

//#####################################################################


void draw2ToggleSquaresK(){
drawGrid(11,9,1,0,0);
for(int i=-1; i<10;++i){
	drawSquare(-1,i,black);
	drawSquare(11,i,black);
}
for(int i=-1; i<12;++i){
	drawSquare(i,-1,black);
	drawSquare(i,9,black);
}
for(int i=4; i<7;++i){
	for(int j=3; j<6;++j){
		drawSquare(i,j,black);
		drawSquare(i,j,black);
	}
}

drawSquare(1,1,black);
drawSquare(1,2,black);
drawSquare(1,3,black);
drawSquare(1,4,black);
drawSquare(1,5,black);
drawSquare(1,6,black);
drawSquare(1,7,black);
drawSquare(2,1,black);
drawSquare(2,3,black);
drawSquare(2,4,black);
drawSquare(2,5,black);
drawSquare(2,7,black);
drawSquare(4,0,black);
drawSquare(4,1,black);
drawSquare(4,3,black);
drawSquare(4,5,black);
drawSquare(4,7,black);
drawSquare(4,8,black);
drawSquare(5,0,black);
drawSquare(5,1,black);
drawSquare(5,7,black);
drawSquare(5,8,black);
drawSquare(6,0,black);
drawSquare(6,1,black);
drawSquare(6,3,black);
drawSquare(6,5,black);
drawSquare(6,7,black);
drawSquare(6,8,black);
drawSquare(8,1,black);
drawSquare(8,3,black);
drawSquare(8,4,black);
drawSquare(8,5,black);
//drawSquare(8,6,black);
drawSquare(8,7,black);
drawSquare(9,1,black);
drawSquare(9,2,black);
drawSquare(9,3,black);
drawSquare(9,4,black);
drawSquare(9,5,black);
drawSquare(9,6,black);
drawSquare(9,7,black);
}



void draw2ToggleBlocksK(){

	drawBlock(3.5,2.5,red);
	drawBlock(3.5,3.5,red);
	drawBlock(3.5,5.5,red);
	drawBlock(3.5,6.5,red);
	drawBlock(4.5,6.5,red);
	drawBlock(7.5,2.5,red);
	drawBlock(7.5,3.5,red);
	drawBlock(7.5,5.5,red);
	drawBlock(7.5,6.5,red);
	drawBlock(6.5,2.5,red);
	drawBlock(4.5,2.5,red);
	drawBlock(3.5,5.5,red);
	drawBlock(6.5,6.5,red);


	drawElipsis(3.5,4.5,black);
	drawElipsis(7.5,4.5,black);
	drawElipsis(5.5,2.5,black);
	drawElipsis(5.5,6.5,black);	
}


void draw2ToggleLabelsK(){
label("1b",(2.5,2.5), blue+fontsize(7pt));
label("1a",(2.5,6.5), blue+fontsize(7pt));
label("2b",(8.5,2.5), blue+fontsize(7pt));
label("2a",(8.5,6.5), blue+fontsize(7pt));
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
drawBlock(2.5,3.5,red);
drawBlock(2.5,5.5,red);
drawBlock(3.5,5.5,red);
}

void drawSetVerifyBlocksSet(){
drawBlock(3.5,3.5,red);
drawBlock(2.5,3.5,red);
drawBlock(2.5,5.5,red);
drawBlock(3.5,4.5,red);
}

void drawSetVerifyBlocksVerified(){
drawBlock(3.5,3.5,red);
drawBlock(2.5,3.5,red);
drawBlock(3.5,5.5,red);
drawBlock(3.5,4.5,red);
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
label("$S_0$",(1.5,0.5), blue+fontsize(7pt));
label("$S$",(4.5,6.5), blue+fontsize(7pt));
label("$V_0$",(0.5,4.5), blue+fontsize(7pt));
label("$V$",(1.5,6.5), blue+fontsize(7pt));
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
label("$S_0$",(1.5,2.5), blue+fontsize(7pt));
label("$S$",(3.5,4.5), blue+fontsize(7pt));
label("$V_0$",(2.5,6.5), blue+fontsize(7pt));
label("$V$",(1.5,5.5), blue+fontsize(7pt));
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
pen wallPen = black+linewidth(2pt);
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

//draw2Toggle();
//draw2TogglePathA();
//shipout("2Toggle");
//erase();

//drawBroken2Toggle();
//shipout("broken2Toggle");
//erase();

draw2ToggleK();
shipout("2ToggleK");
erase();

//drawSetVerifyUnset();
//shipout("SetVerifyUnset");
//erase();

//drawSetVerifySet();
//shipout("SetVerifySet");
//erase();

//drawSetVerifyVerified();
//shipout("SetVerifyVerified");
//erase();

//drawSetVerify3D();
//shipout("SetVerify3D");
//erase();

//drawCrossoverDestructive();
//shipout("CrossoverDestructive");
//erase();

//drawCrossoverInorder();
//shipout("CrossoverInorder");
//erase();




