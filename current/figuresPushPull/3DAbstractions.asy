size(10cm,0);
import math;
import solids;
import settings;
outformat="pdf";

real boxHeight = 4;
real boxWidth = 2;
real lineLength = 1.5;
real lineOffset = .3;
real textHeightOffset = .2;

defaultpen(linewidth(1));

pen labelPen = blue+fontsize(1pt);

pen pathPen = deepgreen+linewidth(1.4);

pen dotColor = yellow;


void drawAbstract2Toggle(real xoffset, real yoffset){
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset));
	
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed);
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed);
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset));
}

void drawAbstractSetVerifyLabels(real xoffset, real yoffset,real fontSize,string state){
	label(scale(fontSize)*"$S_i$",(lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"$V_i$",(lineOffset+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"$S_o$",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"$V_o$",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);
	
	label(scale(fontSize*5)*state,(.5*boxWidth+1*lineLength+xoffset,boxHeight/2+yoffset), labelPen);
}

void drawAbstractSetVerifyLabelsFlipped(real xoffset, real yoffset,real fontSize,string state){
	label(scale(fontSize)*"$S_o$",(lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"$V_o$",(lineOffset+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"$S_i$",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"$V_i$",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);
	
	label(scale(fontSize*5)*state,(.5*boxWidth+1*lineLength+xoffset,boxHeight/2+yoffset), labelPen);
}

void drawAbstractSetVerifyUnset(real xoffset, real yoffset,real fontSize){
	drawAbstract2Toggle(0+xoffset,0+yoffset);
	drawAbstractSetVerifyLabels(0+xoffset,0+yoffset,fontSize,"U");
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed);
}

void drawAbstractSetVerifyUnsetFlipped(real xoffset, real yoffset,real fontSize){
	drawAbstract2Toggle(0+xoffset,0+yoffset);
	drawAbstractSetVerifyLabelsFlipped(0+xoffset,0+yoffset,fontSize,"U");
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed);
}

void drawAbstractSetVerifySet(real xoffset, real yoffset,real fontSize){
	drawAbstract2Toggle(0+xoffset,0+yoffset);
	drawAbstractSetVerifyLabels(0+xoffset,0+yoffset,fontSize,"S");
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
}

void drawAbstractSetVerifySetFlipped(real xoffset, real yoffset,real fontSize){
	drawAbstract2Toggle(0+xoffset,0+yoffset);
	drawAbstractSetVerifyLabelsFlipped(0+xoffset,0+yoffset,fontSize,"S");
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
}

void drawAbstractSetVerifyVerified(real xoffset, real yoffset,real fontSize){
	drawAbstract2Toggle(0+xoffset,0+yoffset);
	drawAbstractSetVerifyLabels(0+xoffset,0+yoffset,fontSize,"V");
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed);
	draw((boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, Arrows);
}

void drawAbstractSetVerifyVerifiedFlipped(real xoffset, real yoffset,real fontSize){
	drawAbstract2Toggle(0+xoffset,0+yoffset);
	drawAbstractSetVerifyLabelsFlipped(0+xoffset,0+yoffset,fontSize,"V");
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset), dashed);
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, Arrows);
}

void drawInOrderCrossover(){
	real TwoToggleWidth = boxWidth+2*lineLength;
	real Seperation = 1.5*lineLength;
	drawAbstractSetVerifyVerifiedFlipped(0,0,1.5);
	drawAbstractSetVerifyUnset(TwoToggleWidth+Seperation,0,1.5);
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right});	
}

void drawInOrderCrossoverTraversal1(){
	real TwoToggleWidth = boxWidth+2*lineLength;
	real Seperation = 1.5*lineLength;
	drawAbstractSetVerifySetFlipped(0,0,1.5);
	drawAbstractSetVerifyUnset(TwoToggleWidth+Seperation,0,1.5);
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right});	
	
	draw((0,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4), pathPen, arrow=ArcArrow());
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right});
}

void drawInOrderCrossoverTraversal2(){
	real TwoToggleWidth = boxWidth+2*lineLength;
	real Seperation = 1.5*lineLength;
	drawAbstractSetVerifySetFlipped(0,0,1.5);
	drawAbstractSetVerifySet(TwoToggleWidth+Seperation,0,1.5);
	
	draw((0,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4), pathPen);
	draw((TwoToggleWidth+Seperation, lineOffset){right}--(2*TwoToggleWidth+Seperation, lineOffset), pathPen, arrow=ArcArrow());
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right}, pathPen);
}

void drawOneWayDestructiveCrossover(){
	real TwoToggleWidth = boxWidth+2*lineLength;
	real Seperation = 1.5*lineLength;
	drawAbstractSetVerifySet(0,0,1.5);
	drawAbstractSetVerifySetFlipped(TwoToggleWidth+Seperation,0,1.5);
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right});	
}

void drawOneWayDestructiveCrossoverTraversal1(){
	real TwoToggleWidth = boxWidth+2*lineLength;
	real Seperation = 1.5*lineLength;
	drawAbstractSetVerifyVerified(0,0,1.5);
	drawAbstractSetVerifySetFlipped(TwoToggleWidth+Seperation,0,1.5);
	
	draw((0,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4), pathPen, arrow=ArcArrow());
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right});	
}

void drawOneWayDestructiveCrossoverTraversal2(){
	real TwoToggleWidth = boxWidth+2*lineLength;
	real Seperation = 1.5*lineLength;
	drawAbstractSetVerifyVerified(0,0,1.5);
	drawAbstractSetVerifyUnsetFlipped(TwoToggleWidth+Seperation,0,1.5);
	
	draw((0,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4), pathPen);
	draw((TwoToggleWidth+Seperation, lineOffset){right}--(2*TwoToggleWidth+Seperation, lineOffset), pathPen, arrow=ArcArrow());
	
	draw((TwoToggleWidth, lineOffset){right}..(TwoToggleWidth+Seperation, lineOffset+3*boxHeight/4){right});
	draw((TwoToggleWidth, lineOffset+3*boxHeight/4){right}..(TwoToggleWidth+Seperation, lineOffset){right}, pathPen);	
}

////////////////////////////////////////
// 4ToggleSection
///////////////////////////////////////

void drawAbstract4ToggleA(real xoffset, real yoffset, real fontSize){
	path box = (lineLength,0)--(lineLength,boxHeight)--(lineLength+boxWidth,boxHeight)--(lineLength+boxWidth,0)--cycle;
	draw(box);
	
	draw((0,lineOffset)--(lineLength,lineOffset));
	draw((0,lineOffset+boxHeight/4)--(lineLength,lineOffset+boxHeight/4));
	draw((0,lineOffset+2*boxHeight/4)--(lineLength,lineOffset+2*boxHeight/4));
	draw((0,lineOffset+3*boxHeight/4)--(lineLength,lineOffset+3*boxHeight/4));
	
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	
	draw((boxWidth+lineLength,lineOffset)--(boxWidth+2*lineLength,lineOffset));
	draw((boxWidth+lineLength,lineOffset+boxHeight/4)--(boxWidth+2*lineLength,lineOffset+boxHeight/4));
	draw((boxWidth+lineLength,lineOffset+2*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+2*boxHeight/4));
	draw((boxWidth+lineLength,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4));
	
	label(scale(fontSize)*"A",(0.5*boxWidth+lineLength+xoffset,0.5*boxHeight+yoffset), labelPen);
}

void drawAbstract4ToggleB(real xoffset, real yoffset, real fontSize){
	path box = (lineLength,0)--(lineLength,boxHeight)--(lineLength+boxWidth,boxHeight)--(lineLength+boxWidth,0)--cycle;
	draw(box);
	
	draw((0,lineOffset)--(lineLength,lineOffset));
	draw((0,lineOffset+boxHeight/4)--(lineLength,lineOffset+boxHeight/4));
	draw((0,lineOffset+2*boxHeight/4)--(lineLength,lineOffset+2*boxHeight/4));
	draw((0,lineOffset+3*boxHeight/4)--(lineLength,lineOffset+3*boxHeight/4));
	
	draw(reverse((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset)), dashed, arrow=ArcArrow());
	draw(reverse((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)), dashed, arrow=ArcArrow());
	draw(reverse((lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)), dashed, arrow=ArcArrow());
	draw(reverse((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)), dashed, arrow=ArcArrow());
	
	draw((boxWidth+lineLength,lineOffset)--(boxWidth+2*lineLength,lineOffset));
	draw((boxWidth+lineLength,lineOffset+boxHeight/4)--(boxWidth+2*lineLength,lineOffset+boxHeight/4));
	draw((boxWidth+lineLength,lineOffset+2*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+2*boxHeight/4));
	draw((boxWidth+lineLength,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4));
	
	label(scale(fontSize)*"B",(0.5*boxWidth+lineLength+xoffset,0.5*boxHeight+yoffset), labelPen);
}

void drawAbstract4ToggleLabels(real xoffset, real yoffset,real fontSize){

	label(scale(fontSize)*"1a",(lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2a",(lineOffset+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"3a",(lineOffset+xoffset,lineOffset+2*boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"4a",(lineOffset+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"1b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"3b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+2*boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"4b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	//label(scale(fontSize)*"A",(0.5*boxWidth+lineLength+xoffset,0.55*boxHeight+yoffset), labelPen);
	//draw((0.3*boxWidth+lineLength+xoffset,0.45*boxHeight+yoffset)--(0.7*boxWidth+lineLength+xoffset,0.45*boxHeight+yoffset), arrow=Arrow);

}

void drawLockA(real xoffset, real yoffset, real fontSize){
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((0+xoffset,lineOffset+2*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset));
	draw((0+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset));
	
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	
	draw(arc((boxWidth+lineLength+xoffset,lineOffset+boxHeight*5/8+yoffset), r=boxHeight/8, angle1=-90, angle2=90));
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	label(scale(fontSize)*"A",(0.5*boxWidth+lineLength+xoffset,0.5*boxHeight+yoffset), labelPen);
}

void drawLockAFlip(real xoffset, real yoffset, real fontSize){
	
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw(arc((lineLength+xoffset,lineOffset+boxHeight*5/8+yoffset), r=boxHeight/8, angle1=-90, angle2=90, direction=CW));
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset), dashed, arrow=ArcArrow());
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset));
	
	label(scale(fontSize)*"A",(0.5*boxWidth+lineLength+xoffset,0.5*boxHeight+yoffset), labelPen);
	
}

void drawLockB(real xoffset, real yoffset, real fontSize){
	
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((0+xoffset,lineOffset+2*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset));
	draw((0+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset));
	
	draw(((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset)), dashed, arrow=ArcArrow());
	draw(((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)), dashed, arrow=ArcArrow());
	draw(((lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset)), dashed, arrow=ArcArrow());
	draw(((lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset)), dashed, arrow=ArcArrow());
	
	draw(arc((boxWidth+lineLength+xoffset,lineOffset+boxHeight*5/8+yoffset), r=boxHeight/8, angle1=-90, angle2=90));
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	label(scale(fontSize)*"A",(0.5*boxWidth+lineLength+xoffset,0.5*boxHeight+yoffset), labelPen);
	
}

void drawBinaryCounterLabelsA(real xoffset, real yoffset,real fontSize){

	label(scale(fontSize)*"1a",(0.5*lineLength+lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2b",(0.5*lineLength+lineOffset+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"1b",(lineOffset+boxWidth+1*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2a",(lineOffset+boxWidth+1*lineLength+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"A",(0.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	//draw((0.3*boxWidth+lineLength+xoffset,0.2*boxHeight+yoffset)--(0.7*boxWidth+lineLength+xoffset,0.2*boxHeight+yoffset), arrow=Arrow);

}

void drawBinaryCounterLabelsB(real xoffset, real yoffset,real fontSize){

	label(scale(fontSize)*"1a",(0.5*lineLength+lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2b",(0.5*lineLength+lineOffset+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"1b",(lineOffset+boxWidth+1*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2a",(lineOffset+boxWidth+1*lineLength+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"B",(0.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	//draw((0.3*boxWidth+lineLength+xoffset,0.2*boxHeight+yoffset)--(0.7*boxWidth+lineLength+xoffset,0.2*boxHeight+yoffset), arrow=Arrow);

}

void drawLockWithLabelsA(real xoffset, real yoffset,real fontSize){
	drawLockA(xoffset, yoffset, fontSize);
	drawAbstract4ToggleLabels(xoffset, yoffset, fontSize);
}

void drawLockWithLabelsAFlip(real xoffset, real yoffset,real fontSize){
	drawLockAFlip(xoffset, yoffset, fontSize);
	drawAbstract4ToggleLabels(xoffset, yoffset, fontSize);
}

void drawLockWithLabelsB(real xoffset, real yoffset,real fontSize){
	drawLockB(xoffset, yoffset, fontSize);
	drawAbstract4ToggleLabels(xoffset, yoffset, fontSize);
}

void drawBinaryCounterBlockA(real xoffset, real yoffset, real fontSize){
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	draw(reverse((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset){right} .. {(1,-3)}(boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset){right} .. {right}(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	drawBinaryCounterLabelsA(xoffset, yoffset, fontSize);
}

void drawBinaryCounterBlockB(real xoffset, real yoffset, real fontSize){
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	draw(reverse((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset)), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	draw((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset){right} .. {(1,-3)}(boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset){right} .. {right}(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	drawBinaryCounterLabelsB(xoffset, yoffset, fontSize);
	
}

void drawSynchronizedLockBlock(int chainLength){
	real lockBlockLength = 2*lineLength+boxWidth;
	real lockBlockSeperation = 1*lineLength;
	
	defaultpen(linewidth(1/chainLength));
		
	drawLockWithLabelsA(0,0,5/chainLength);
	for(int i=1; i<chainLength; ++i){
		drawLockWithLabelsA(i*(lockBlockLength+lockBlockSeperation),0,5/chainLength);
		draw((i*lockBlockLength+(i-1)*lockBlockSeperation,lineOffset)--(i*(lockBlockLength+lockBlockSeperation),lineOffset));
		draw((i*lockBlockLength+(i-1)*lockBlockSeperation,lineOffset+boxHeight/4)--(i*(lockBlockLength+lockBlockSeperation),lineOffset+boxHeight/4));
	}
	
	
}

void drawBinaryCounter000(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	//fill(circle((0,boxHeight/4+lineOffset),.15),dotColor);
}

void drawBinaryCounter100(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
}

void drawBinaryCounter010(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
}

void drawBinaryCounter110(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
}

void drawBinaryCounter001(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
}

void drawBinaryCounterAnimation1(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation2(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawBinaryCounterAnimation3(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,boxHeight/4+lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation4(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((blockSize,lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation5(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((blockSize+boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawBinaryCounterAnimation6(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation7(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawBinaryCounterAnimation8(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,boxHeight/4+lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation9(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((blockSize,boxHeight/4+lineOffset),.15),dotColor);
}


void drawBinaryCounterAnimation10(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockA(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((2*blockSize,lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation11(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((2*blockSize+boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawBinaryCounterAnimation12(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,lineOffset),.15),dotColor);
}


void drawBinaryCounterAnimation13(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawBinaryCounterAnimation14(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,boxHeight/4+lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation15(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockA(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((blockSize,lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation16(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((blockSize+boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawBinaryCounterAnimation17(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockA(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((0,lineOffset),.15),dotColor);
}

void drawBinaryCounterAnimation18(){
	real blockSize = 2*lineLength+boxWidth;
	drawBinaryCounterBlockB(0,0,1.5);
	drawBinaryCounterBlockB(blockSize,0,1.5);
	drawBinaryCounterBlockB(2*blockSize,0,1.5);
	draw((0,lineOffset+1*boxHeight/4)--(0,-boxHeight/8)--(boxWidth+1.7*lineLength+2*blockSize,-boxHeight/8));
	fill(circle((boxWidth+1.7*lineLength,-boxHeight/8),.15),dotColor);
}

void drawAnimatedBinaryCounter(){
	// drawBinaryCounter000();
	// shipout("BinaryCounter000");
	// erase();
	
	// drawBinaryCounter100();
	// shipout("BinaryCounter100");
	// erase();	

	// drawBinaryCounter010();
	// shipout("BinaryCounter010");
	// erase();	

	// drawBinaryCounter110();
	// shipout("BinaryCounter110");
	// erase();	
	
	// drawBinaryCounter001();
	// shipout("BinaryCounter001");
	// erase();	
	
	drawBinaryCounterAnimation1();
	shipout("BinaryCounterAnimated1");
	erase();
	
	
	drawBinaryCounterAnimation2();
	shipout("BinaryCounterAnimated2");
	erase();
	
	
	drawBinaryCounterAnimation3();
	shipout("BinaryCounterAnimated3");
	erase();
	
	drawBinaryCounterAnimation4();
	shipout("BinaryCounterAnimated4");
	erase();

	drawBinaryCounterAnimation5();
	shipout("BinaryCounterAnimated5");
	erase();
	
	drawBinaryCounterAnimation6();
	shipout("BinaryCounterAnimated6");
	erase();
	
	drawBinaryCounterAnimation7();
	shipout("BinaryCounterAnimated7");
	erase();

	drawBinaryCounterAnimation8();
	shipout("BinaryCounterAnimated8");
	erase();
	
	drawBinaryCounterAnimation9();
	shipout("BinaryCounterAnimated9");
	erase();
	
	drawBinaryCounterAnimation10();
	shipout("BinaryCounterAnimated10");
	erase();
	
	
	drawBinaryCounterAnimation11();
	shipout("BinaryCounterAnimated11");
	erase();
	
	
	drawBinaryCounterAnimation12();
	shipout("BinaryCounterAnimated12");
	erase();
	
	
	drawBinaryCounterAnimation13();
	shipout("BinaryCounterAnimated13");
	erase();
	
	drawBinaryCounterAnimation14();
	shipout("BinaryCounterAnimated14");
	erase();

	drawBinaryCounterAnimation15();
	shipout("BinaryCounterAnimated15");
	erase();
	
	drawBinaryCounterAnimation16();
	shipout("BinaryCounterAnimated16");
	erase();

	drawBinaryCounterAnimation17();
	shipout("BinaryCounterAnimated17");
	erase();
	
	drawBinaryCounterAnimation18();
	shipout("BinaryCounterAnimated18");
	erase();
}

void drawUniversalGadget(real xoffset, real yoffset){
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,boxHeight+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((0+xoffset,lineOffset+2*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+2*boxHeight/4+yoffset));
	draw((0+xoffset,lineOffset+3*boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+3*boxHeight/4+yoffset));
	
	draw(arc((boxWidth+lineLength+xoffset,lineOffset+boxHeight*5/8+yoffset), r=boxHeight/8, angle1=-90, angle2=90));
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset){right} .. {(1,-3)}(boxWidth+1.7*lineLength+xoffset,0+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset){right} .. {right}(boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
}

void drawUniversalLabels(real xoffset, real yoffset, real fontSize, string centerLabel){
	label(scale(fontSize)*"1a",(lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2b",(lineOffset+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"3a",(lineOffset+xoffset,lineOffset+2*boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"4a",(lineOffset+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"1b",(lineOffset+boxWidth+1*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2a",(lineOffset+boxWidth+1*lineLength+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"3b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+2*boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"4b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*centerLabel,(0.5*boxWidth+lineLength+xoffset,1.06*boxHeight+yoffset), labelPen);
	// draw((0.3*boxWidth+lineLength+xoffset,0.45*boxHeight+yoffset)--(0.7*boxWidth+lineLength+xoffset,0.45*boxHeight+yoffset), arrow=Arrow);
}

void drawExistentialLabels(real xoffset, real yoffset, real fontSize, string centerLabel){
	label(scale(fontSize)*"1a",(lineOffset+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2a",(lineOffset+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"3a",(lineOffset+xoffset,lineOffset+2*boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"4a",(lineOffset+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*"1b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"2b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"3b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+2*boxHeight/4+textHeightOffset+yoffset), labelPen);
	label(scale(fontSize)*"4b",(lineOffset+boxWidth+1.3*lineLength+xoffset,lineOffset+3*boxHeight/4+textHeightOffset+yoffset), labelPen);

	label(scale(fontSize)*centerLabel,(0.5*boxWidth+lineLength+xoffset,1.06*boxHeight+yoffset), labelPen);
	// draw((0.3*boxWidth+lineLength+xoffset,0.45*boxHeight+yoffset)--(0.7*boxWidth+lineLength+xoffset,0.45*boxHeight+yoffset), arrow=Arrow);
}

void drawUniversalWithLabels(real xoffset, real yoffset, real fontSize, string centerLabel){
	drawUniversalGadget(xoffset, yoffset);
	drawUniversalLabels(xoffset, yoffset, fontSize, centerLabel);
}

void drawExistentialGadget(real xoffset, real yoffset, real tailSize, real fontSize, string centralLabel){
	real lockWidth = boxWidth +2*lineLength;
	
	drawLockWithLabelsA(xoffset,yoffset,fontSize);
	label(scale(fontSize)*"$x$",(0.5*boxWidth+lineLength+xoffset,1.06*boxHeight+yoffset), labelPen);
	drawLockWithLabelsAFlip(xoffset+lockWidth+lineLength,yoffset,fontSize);
	label(scale(fontSize)*"$\bar{x}$",(0.5*boxWidth+lineLength+lockWidth+lineLength+xoffset,1.06*boxHeight+yoffset), labelPen);
	
	draw((0+xoffset,lineOffset+yoffset)--(0+xoffset,-lineOffset+yoffset)--(2*lockWidth+lineLength+xoffset,-lineOffset+yoffset)--(2*lockWidth+lineLength+xoffset,lineOffset+yoffset));
	draw((lockWidth+xoffset,lineOffset+yoffset)--(lockWidth+lineLength+xoffset,lineOffset+yoffset));
	draw((lockWidth+0.5*lineLength+xoffset,-lineOffset+yoffset)--(lockWidth+0.5*lineLength+xoffset,-tailSize+yoffset));
}

// void drawQuantifierChain(int chainLength){
	// real lockBlockLength = 2*lineLength+boxWidth;
	// real lockBlockSeperation = 3*lineLength+boxWidth;
	// real existentialTail = lineLength+boxWidth;
	// real initialLockOffset = 0.5*(lockBlockSeperation + lockBlockLength);
		
	// drawUniversalWithLabels(initialLockOffset,0,2/chainLength, "$y_1$");
	// drawExistentialGadget(0,existentialTail+lineOffset,existentialTail,2/chainLength, "$x_1$");
	// draw((0,lineOffset)--(initialLockOffset,lineOffset));
	// for(int i=1; i<chainLength; ++i){
		// drawExistentialGadget(i*(lockBlockLength+lockBlockSeperation),existentialTail+lineOffset,existentialTail,2/chainLength, "$x_"+(string) (i+1)+"$");
		// drawUniversalWithLabels(i*(lockBlockLength+lockBlockSeperation)+initialLockOffset,0,2/chainLength, "$y_"+(string) (i+1)+"$");
		// draw((i*lockBlockLength+(i-1)*lockBlockSeperation+initialLockOffset,lineOffset)--(i*(lockBlockLength+lockBlockSeperation)+initialLockOffset,lineOffset));
	// }
// }

void drawQuantifierChain(int chainLength){
	real lockBlockLength = 2*lineLength+boxWidth;
	real lockBlockSeperation = 3*lineLength+boxWidth;
	real existentialTail = lineLength+boxWidth;
	real initialLockOffset = 0.5*(lockBlockSeperation + lockBlockLength);
	real bottomLine = -(boxHeight/8+boxHeight+1.5*lineLength);
	real fontSize = 1.5;
	
	real xoffset = 0;
	real yoffset = 0;
	
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize)*"$\forall y_1$",(0.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	// draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	// draw(reverse((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset){right} .. {(1,-3)}(boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset));
	draw((boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset)--(boxWidth+1.7*lineLength+xoffset,bottomLine));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(2*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((3*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset){right} .. {right}(3*boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((3*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(3*boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	box = (2*boxWidth+lineLength+xoffset,0+yoffset)--(2*boxWidth+lineLength+xoffset,boxHeight/2+yoffset)--(3*boxWidth+lineLength+xoffset,boxHeight/2+yoffset)--(3*boxWidth+lineLength+xoffset,0+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize)*"$\exists x_1$",(2.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	
	
	real xoffset = 3*boxWidth+2*lineLength;
	real yoffset = 0;
	
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize)*"$\forall y_2$",(0.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	// draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	// draw(reverse((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset){right} .. {(1,-3)}(boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(2*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((3*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset){right} .. {right}(3*boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((3*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(3*boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	draw((boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset)--(boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset));
	box = (0.1*boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset)--(1.9*boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset)--(1.9*boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--(0.1*boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--cycle;
	draw(box);
	label(scale(fontSize)*"$y_1 \leftarrow 0$",(boxWidth+1.7*lineLength+xoffset,-3*boxHeight/8-.5*lineLength+yoffset), labelPen);
	draw((boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--(boxWidth+1.7*lineLength+xoffset,bottomLine));
	
	box = (2*boxWidth+lineLength+xoffset,0+yoffset)--(2*boxWidth+lineLength+xoffset,boxHeight/2+yoffset)--(3*boxWidth+lineLength+xoffset,boxHeight/2+yoffset)--(3*boxWidth+lineLength+xoffset,0+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize)*"$\exists x_2$",(2.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	
	
	real xoffset = 6*boxWidth+4*lineLength;
	real yoffset = 0;
	
	path box = (lineLength+xoffset,0+yoffset)--(lineLength+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,boxHeight/2+yoffset)--(lineLength+boxWidth+xoffset,0+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize)*"$\forall y_3$",(0.5*boxWidth+lineLength+xoffset,0.25*boxHeight+yoffset), labelPen);
	
	draw((0+xoffset,lineOffset+yoffset)--(lineLength+xoffset,lineOffset+yoffset));
	draw((0+xoffset,lineOffset+boxHeight/4+yoffset)--(lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	// draw((lineLength+xoffset,lineOffset+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+yoffset), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	// draw(reverse((lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)--(boxWidth+lineLength+xoffset,lineOffset+1*boxHeight/4+yoffset)), dashed+linewidth(fontSize/2), arrow=ArcArrow());
	
	draw((boxWidth+lineLength+xoffset,lineOffset+yoffset){right} .. {(1,-3)}(boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset));
	draw((boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(2*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	draw((3*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset){right} .. {right}(3*boxWidth+2*lineLength+xoffset,lineOffset+yoffset));
	draw((3*boxWidth+lineLength+xoffset,lineOffset+boxHeight/4+yoffset)--(3*boxWidth+2*lineLength+xoffset,lineOffset+boxHeight/4+yoffset));
	
	draw((boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset)--(boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset));
	box = (0.1*boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset)--(1.9*boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset)--(1.9*boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--(0.1*boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--cycle;
	draw(box);
	label(scale(fontSize)*"$y_1 \leftarrow 0$",(boxWidth+1.7*lineLength+xoffset,-3*boxHeight/8-.5*lineLength+yoffset), labelPen);
	draw((boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--(boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-1*lineLength+yoffset));
	
	yoffset = -(boxHeight + lineLength)/2;
	
	draw((boxWidth+1.7*lineLength+xoffset,-boxHeight/8+yoffset)--(boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset));
	box = (0.1*boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset)--(1.9*boxWidth+1.7*lineLength+xoffset,-boxHeight/8-.5*lineLength+yoffset)--(1.9*boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--(0.1*boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--cycle;
	draw(box);
	label(scale(fontSize)*"$y_2 \leftarrow 0$",(boxWidth+1.7*lineLength+xoffset,-3*boxHeight/8-.5*lineLength+yoffset), labelPen);
	draw((boxWidth+1.7*lineLength+xoffset,-5*boxHeight/8-.5*lineLength+yoffset)--(boxWidth+1.7*lineLength+xoffset,bottomLine));
	
		
	box = (-boxWidth,-boxHeight/8+yoffset)--(-boxWidth,boxHeight/8+yoffset)--(boxWidth,boxHeight/8+yoffset)--(boxWidth,-boxHeight/8+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize*.8)*"formula",(0,yoffset), labelPen);
	
	draw((0,lineOffset+1*boxHeight/4)--(0,boxHeight/8+yoffset));
	draw((0,-boxHeight/8+yoffset)--(0,bottomLine));
	draw((0,bottomLine)--(boxWidth+1.7*lineLength+xoffset,bottomLine));
	
	yoffset = 0;
	
	box = (2*boxWidth+lineLength+xoffset,0+yoffset)--(2*boxWidth+lineLength+xoffset,boxHeight/2+yoffset)--(3*boxWidth+lineLength+xoffset,boxHeight/2+yoffset)--(3*boxWidth+lineLength+xoffset,0+yoffset)--cycle;
	draw(box);
	
	label(scale(fontSize)*"$\exists x_3$",(2.5*boxWidth+lineLength+xoffset,yoffset+boxHeight/4), labelPen);


		
	// drawUniversalWithLabels(initialLockOffset,0,2/chainLength, "$y_1$");
	// drawExistentialGadget(0,existentialTail+lineOffset,existentialTail,2/chainLength, "$x_1$");
	// draw((0,lineOffset)--(initialLockOffset,lineOffset));
	// for(int i=1; i<chainLength; ++i){
		// drawExistentialGadget(i*(lockBlockLength+lockBlockSeperation),existentialTail+lineOffset,existentialTail,2/chainLength, "$x_"+(string) (i+1)+"$");
		// drawUniversalWithLabels(i*(lockBlockLength+lockBlockSeperation)+initialLockOffset,0,2/chainLength, "$y_"+(string) (i+1)+"$");
		// draw((i*lockBlockLength+(i-1)*lockBlockSeperation+initialLockOffset,lineOffset)--(i*(lockBlockLength+lockBlockSeperation)+initialLockOffset,lineOffset));
	// }
}

void drawSATGraph(){
	real height = 5;
	real variableSpacing = 2;
	real clauseSpacing = 2;
	real variableOffset = 0;
	real clauseOffset = 0;
	
	
	label(scale(5)*"$x_1$",(variableOffset, height), N, labelPen);
	label(scale(5)*"$x_2$",(variableOffset+variableSpacing, height), N, labelPen);
	label(scale(5)*"$x_3$",(variableOffset+2*variableSpacing, height), N, labelPen);
	label(scale(5)*"$x_4$",(variableOffset+3*variableSpacing, height), N, labelPen);
	
	label(scale(5)*"$C_1$",(clauseOffset, 0), S, labelPen);
	label(scale(5)*"$C_2$",(clauseOffset+clauseSpacing, 0), S, labelPen);
	label(scale(5)*"$C_3$",(clauseOffset+2*clauseSpacing, 0), S, labelPen);
	label(scale(5)*"$C_4$",(clauseOffset+3*clauseSpacing, 0), S, labelPen);
	
	//(a or b or c)
	draw((variableOffset, height)--(clauseOffset,0));
	draw((variableOffset+variableSpacing, height)--(clauseOffset,0));
	draw((variableOffset+2*variableSpacing, height)--(clauseOffset,0));
	
	//(d or b or c)
	draw((variableOffset+3*variableSpacing, height)--(clauseOffset+clauseSpacing,0));
	draw((variableOffset+variableSpacing, height)--(clauseOffset+clauseSpacing,0));
	draw((variableOffset+2*variableSpacing, height)--(clauseOffset+clauseSpacing,0));
	
	//(a or b or d)
	draw((variableOffset, height)--(clauseOffset+2*clauseSpacing,0));
	draw((variableOffset+1*variableSpacing, height)--(clauseOffset+2*clauseSpacing,0));
	draw((variableOffset+3*variableSpacing, height)--(clauseOffset+2*clauseSpacing,0));
	
	//(a or c or d)
	draw((variableOffset, height)--(clauseOffset+3*clauseSpacing,0));
	draw((variableOffset+2*variableSpacing, height)--(clauseOffset+3*clauseSpacing,0));
	draw((variableOffset+3*variableSpacing, height)--(clauseOffset+3*clauseSpacing,0));
	
}


// drawAbstractSetVerifyUnset(0,0,4);
// shipout("AbstractSetVerifyUnset");
// erase();

// drawAbstractSetVerifySet(0,0,4);
// shipout("AbstractSetVerifySet");
// erase();

// drawAbstractSetVerifyVerified(0,0,4);
// shipout("AbstractSetVerifyVerified");
// erase();

// drawOneWayDestructiveCrossover();
// shipout("OneWayDestructiveCrossover");
// erase();

// drawOneWayDestructiveCrossoverTraversal1();
// shipout("OneWayDestructiveCrossoverTraversal1");
// erase();

// drawOneWayDestructiveCrossoverTraversal2();
// shipout("OneWayDestructiveCrossoverTraversal2");
// erase();

// drawInOrderCrossover();
// shipout("InOrderCrossover");
// erase();

// drawInOrderCrossoverTraversal1();
// shipout("InOrderCrossoverTraversal1");
// erase();

// drawInOrderCrossoverTraversal2();
// shipout("InOrderCrossoverTraversal2");
// erase();

// drawAbstractSetVerifyUnset(0,0,4);
// draw((0,lineOffset)--(boxWidth+2*lineLength,lineOffset), deepgreen+linewidth(2), arrow=ArcArrow());
// shipout("AbstractSetVerifySetTransition");
// erase();

// drawAbstractSetVerifySet(0,0,4);
// draw((0,lineOffset+3*boxHeight/4)--(boxWidth+2*lineLength,lineOffset+3*boxHeight/4), deepgreen+linewidth(2), arrow=ArcArrow());
// shipout("AbstractSetVerifyVerifyTransition");
// erase();






// drawAbstract4ToggleA(0,0,6);
// drawAbstract4ToggleLabels(0,0,4);
// shipout("Abstract4ToggleA");
// erase();

// drawAbstract4ToggleB(0,0,6);
// drawAbstract4ToggleLabels(0,0,4);
// shipout("Abstract4ToggleB");
// erase();
	
// drawLockWithLabelsAFlip(0,0,4);
// shipout("LockA");
// erase();

// drawLockWithLabelsB(0,0,4);
// shipout("LockB");
// erase();

// drawSynchronizedLockBlock(3);
// shipout("LockBlock");
// erase();

// drawExistentialGadget(0,0, 1, 2, "X");
// shipout("ExistentialGadget");
// erase();

// drawBinaryCounter000();
// shipout("BinaryCounter000");
// erase();

// drawAnimatedBinaryCounter();

// drawUniversalWithLabels(0,0,4, "y");
// shipout("UniversalGadget");
// erase();

drawQuantifierChain(3);
shipout("QuantifierChain");
erase();


// drawSATGraph();
// shipout("SATGraph");
// erase();
