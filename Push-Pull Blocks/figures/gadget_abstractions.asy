size(5cm,0);
import math;
import solids;
import settings;
outformat="pdf";

defaultpen(1);


void draw2toggle(real x, real y, pen c){
wire_length = .8;
draw(box((x,y),(x+3,y+2)),c);
draw((x-wire_length,y+.5)--(x,y+.5));
draw((x-wire_length,y+1.5)--(x,y+1.5));
draw((x+3,y+.5)--(x+3+wire_length,y+.5));
draw((x+3,y+1.5)--(x+3+wire_length,y+1.5));

label("1b",(x-wire_length,y+.5), blue+fontsize(7pt));
label("1a",(x-wire_length,y+1.5), blue+fontsize(7pt));
label("2b",(x+3,y+.5), blue+fontsize(7pt));
label("2a",(x+3,y+1.5), blue+fontsize(7pt));
}

draw2toggle(0,0, black);