// This houses the customizations that will stay consistent between
// files, such as default font size, commonly used pen colors,
// etc. Always include it.

include fontsize;

defaultpen(fontsize(8pt));

pen thick = linewidth(1.5*linewidth(currentpen));
pen closeDotted =linetype(new real[] {0,3});
pen thinPen = fontsize(4pt);

usepackage("amsmath");

void
zshipout(string fname) {
  shipout(fname, format="pdf");
  shipout(fname, format="eps");
  shipout("preview-" + fname, format="png");
  write("  ", fname);
}

// set-up for the three-dimensional stuff
import three;
bool flat = false;

// camera settings
currentprojection = perspective(4.1, -7.5, 2.9);

// light settings
pen colorA = red + purple;
pen colorB = blue + purple;

currentlight = light(
	diffuse = new pen[]{colorA, colorB},
	position = new triple[]{(10, 0, 0), (0, 0, 10)},
	specular = new pen[]{black, black},
	ambient = new pen[]{black, black}
);

// pen color settings
pen penLine;
if (flat) {
	penLine = blue + linewidth(32.0 * linewidth());
} else {
	penLine = white + linewidth(32.0 * linewidth());
}

