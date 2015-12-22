import three;
import solids;

real EPSILON = 0.0001;
bool dividers = true;

path3 goodCircle;
int nCount = 24;
for (int i = 0; i < nCount; ++i) {
	real theta = 2 * pi * i / nCount;
	goodCircle = goodCircle -- (sin(theta), cos(theta), 0);
}

goodCircle = goodCircle -- cycle;

real getArrowLength(real pipeRadius) {
	return 4 * pipeRadius;
}

real getArrowRadius(real pipeRadius) {
	return 1.5 * pipeRadius;
}

bool pathEquals(path3 a, path3 b) {
	if (size(a) != size(b)) {
		return false;
	}

	if (! (cyclic(a) && cyclic(b))) {
		abort("cannot check equality on non-cyclic paths!");
	}

	for (int i = 0; i < size(b); ++i) {
		if (length(point(a, 0) - point(b, i)) < EPSILON) {
			bool forwardMatch = true;
			bool reverseMatch = true;

			for (int shift = 0; shift < size(b); ++shift) {
				if (length(point(a, shift) - point(b, i + shift)) > EPSILON) {
					forwardMatch = false;
				}

				if (length(point(a, shift) - point(b, i - shift)) > EPSILON) {
					reverseMatch = false;
				}
			}

			if (forwardMatch || reverseMatch) {
				return true;
			}
		}
	}

	return false;
}

triple getCameraDirection() {
	return dir(currentprojection.target - currentprojection.camera);
}

// sheets are assumed to be (a) unique, and (b) non-overlapping
struct sheet {
	path3 outline;
	pen color;
	string name;

	void operator init(path3 p, pen c, string name = "") {
		if (! cyclic(p)) abort("path must be cyclic!");
		// TODO check that it lies in a plane?
		// TODO check that it consists of straight segments?

		this.outline = p;
		this.color = c;
		this.name = name;
	}

	real size() {
		triple maxBounds = max(this.outline);
		triple minBounds = min(this.outline);
		return length(maxBounds - minBounds);
	}

	triple center() {
		triple result = (0, 0, 0);

		for (int i = 0; i < size(this.outline); ++i) {
			result = result + point(this.outline, i);
		}

		return result / size(this.outline);
	}

	triple back() {
		triple cam = getCameraDirection();

		triple result = point(this.outline, 0);
		for (int i = 0; i < size(this.outline); ++i) {
			triple curr = point(this.outline, i);

			if (dot(cam, result) < dot(cam, curr)) {
				result = curr;
			}
		}

		return result;
	}

	real distance() {
		return dot(this.back(), getCameraDirection());
	}

	void draw(bool flat = true) {
		if (flat) {
			filldraw(project(this.outline), this.color);

			if (this.name != "") {
				label(this.name, project(this.center()));
			}
		} else {
			draw(surface(this.outline), this.color, nolight);
			draw(this.outline, nolight);

			if (this.name != "") {
				label(this.name, this.center());
			}
		}
	}
}

void drawArrow(triple curr, triple prev, real radius, pen color) {
	surface tip = shift(0, 0, -getArrowLength(radius)) *
		surface(cone(getArrowRadius(radius), getArrowLength(radius)));
	surface base = shift(0, 0, -getArrowLength(radius)) *
		scale3(getArrowRadius(radius)) * surface(goodCircle);
	transform3 t = shift(curr);

	triple desiredDir = unit(curr - prev);
	if (length(desiredDir - Z) < EPSILON) {
		// orientations are correct
	} else if (length(desiredDir + Z) < EPSILON) {
		t = t * rotate(180, Y);
	} else {
		triple rotAxis = cross(Z, desiredDir);
		real rotAngle = colatitude(desiredDir);
		t = t * rotate(rotAngle, rotAxis);
	}

	draw(t * tip, material(diffusepen = color, ambientpen = color));
	draw(t * base, material(diffusepen = color, ambientpen = color));
}

void drawCap(triple curr, triple prev, real radius, pen color) {
	path3 cap = scale3(radius) * goodCircle;
	transform3 t = shift(curr);

	triple desiredDir = unit(curr - prev);
	if (length(desiredDir - Z) < EPSILON || length(desiredDir + Z) < EPSILON) {
		// orientation is corect
	} else {
		triple rotAxis = cross(Z, desiredDir);
		real rotAngle = colatitude(desiredDir);
		t = t * rotate(rotAngle, rotAxis);
	}

	draw(surface(t * cap), material(diffusepen = color, ambientpen = color));
	if (dividers) {
		draw(t * cap);
	}
}

struct line {
	path3 trace;
	pen color;
	real radius;
	bool arrowStart;
	bool arrowEnd;
	bool alwaysFlat;

	void operator init(path3 trace, pen color, real radius = 0.1,
				bool arrowStart = true, bool arrowEnd = true,
				bool alwaysFlat = false) {
		this.trace = trace;
		this.color = color;
		this.radius = radius;
		this.arrowStart = arrowStart;
		this.arrowEnd = arrowEnd;
	}

	triple center() {
		triple result = (0, 0, 0);

		for (int i = 0; i < size(this.trace); ++i) {
			result = result + point(this.trace, i);
		}

		return result / size(this.trace);
	}

	triple back() {
		triple cam = getCameraDirection();

		triple result = point(this.trace, 0);
		for (int i = 0; i < size(this.trace); ++i) {
			triple curr = point(this.trace, i);

			if (dot(cam, result) < dot(cam, curr)) {
				result = curr;
			}
		}

		return result;
	}

	real distance() {
		return dot(this.back(), getCameraDirection());
	}
	
	void draw(bool flat = true) {
		if (flat) {
			arrowbar arrowValue = None;
			if (this.arrowStart && this.arrowEnd) {
				arrowValue = Arrows;
			} else if (this.arrowStart) {
				arrowValue = BeginArrow;
			} else if (this.arrowEnd) {
				arrowValue = EndArrow;
			}
		
			draw(project(this.trace), this.color, arrowValue);
		} else if (this.alwaysFlat || this.radius < EPSILON) {
			draw(this.trace, this.color, light = nolight);
		} else {
			// handle what happens if we have a start arrow
			real start = 0;
			triple curr = point(this.trace, 0);
			triple prev = arcpoint(this.trace, 0.1);
			if (this.arrowStart) {
				drawArrow(curr, prev, this.radius, this.color);
				start = arctime(this.trace, getArrowLength(this.radius));
			} else {
				drawCap(curr, prev, this.radius, this.color);
			}

			// handle what happens if we have an end arrow
			real end = size(this.trace) - 1;
			triple curr = point(this.trace, size(this.trace) - 1);
			real arcLen = arclength(this.trace);
			triple prev = arcpoint(this.trace, arcLen - 0.1);
			if (this.arrowEnd) {
				drawArrow(curr, prev, this.radius, this.color);
				end = arctime(this.trace, arcLen - getArrowLength(this.radius));
			} else {
				drawCap(curr, prev, this.radius, this.color);
			}

			path3 p = subpath(this.trace, start, end);

			draw(
				tube(p, 2 * this.radius).s,
				material(diffusepen = this.color, ambientpen = this.color),
				light = currentlight
			);
		}
	}
}

// checks whether b is completely in front of the plane containing a
bool inFrontOf(sheet a, sheet b) {
	triple first = point(a.outline, 0);
	triple second = point(a.outline, 1);
	triple third = point(a.outline, 2);

	triple normal = unit(cross(first - second, third - second));
	real value = dot(first, normal);

	real compMin = +100000;
	real compMax = -100000;
	for (int i = 0; i < size(b.outline); ++i) {
		real curr = dot(point(b.outline, i), normal);
		compMin = (curr < compMin ? curr : compMin);
		compMax = (curr > compMax ? curr : compMax);
	}

	if (compMin < value - EPSILON && value + EPSILON < compMax) {
		return false;
	} else {
		real compValue = (compMin + compMax) / 2;
		real cameraValue = dot(currentprojection.camera, normal);

		if ((compValue - value) * (cameraValue - value) > 0) {
			return true;
		} else {
			return false;
		}
	}
}

// functions for ordering sheets and lines based on their distance from
// the current location of the camera
bool sheetOrder(sheet a, sheet b) {
	return a.distance() < b.distance();
}

bool lineOrder(line a, line b) {
	return a.distance() < b.distance();
}

real[] myIntersections(path3 p, path3 s) {
	if (! piecewisestraight(p)) {
		abort("can't use this for curvy lines!");
	}

	real[] result;

	triple a = point(s, 0);
	triple b = point(s, 1);
	triple c = point(s, 2);

	triple norm = unit(cross(a - b, c - b));
	real value = dot(norm, a);

	for (int i = 0; i < length(p); ++i) {
		triple curr = point(p, i);
		real currValue = dot(curr, norm);
		triple next = point(p, i + 1);
		real nextValue = dot(next, norm);

		if (abs(currValue - value) < EPSILON) {
			if (i > 0) {
				result.push(i);
			}
		} else if (abs(nextValue - value) < EPSILON) {
			// do nothing
		} else if ((currValue - value) * (nextValue - value) < EPSILON) {
			real t = (value - currValue) / (nextValue - currValue);
			triple a = point(p, i + t);
			result.push(i + t);
		}
	}

	return result;
}

// split the line into pieces using the given sheet
line[] split(line l, sheet s) {
	real[] breaks;

	breaks.push(0);
	breaks.push(size(l.trace) - 1);

	if (piecewisestraight(l.trace)) {
		breaks.append(myIntersections(l.trace, s.outline));
	} else {
		surface surf = surface(s.outline);
		real[][] times = intersections(l.trace, surf);

		for (int i = 0; i < times.length; ++i) {
			real t = times[i][0];
			if (EPSILON < t && t < size(l.trace) - 1 - EPSILON) {
				breaks.push(t);
			}
		}
	}

	breaks = sort(breaks);

	line[] result;

	for (int i = 0; i < breaks.length - 1; ++i) {
		path3 curr = subpath(l.trace, breaks[i], breaks[i + 1]);
		bool currStart = (l.arrowStart && (i == 0));
		bool currEnd = (l.arrowEnd && (i == breaks.length - 2));
		result.push(line(curr, l.color, l.radius, currStart, currEnd));
	}

	return result;
}

// use the sheets to divide the lines into pieces
line[] getFragments(line[] lines, sheet[] sheets) {
	line[] result;
	result.append(lines);

	for (int i = 0; i < sheets.length; ++i) {
		line[] fragments;

		while (result.length > 0) {
			line l = result.pop();
			fragments.append(split(l, sheets[i]));
		}

		result = fragments;
	}

	return result;
}

struct contents {
	sheet[] sheets;
	line[] lines;
	triple minBounds, maxBounds;

	bool addSheet(sheet s) {
		// check for duplicates
		for (int i = 0; i < this.sheets.length; ++i) {
			if (pathEquals(s.outline, this.sheets[i].outline)) {
				return false;
			}
		}

		this.sheets.push(s);
		return true;
	}

	void setColor(sheet s) {
		bool found = false;

		for (int i = 0; i < this.sheets.length; ++i) {
			if (pathEquals(s.outline, this.sheets[i].outline)) {
				this.sheets[i] = s;
				found = true;
			}
		}

		if (! found) {
			this.sheets.push(s);
		}
	}

	void addLine(line l) {
		this.lines.push(l);
	}

	void clearLines() {
		this.lines.delete();
	}

	void clearSheets() {
		this.sheets.delete();
	}

	void setRange(triple minBounds, triple maxBounds) {
		this.minBounds = minBounds;
		this.maxBounds = maxBounds;
	}

	void clear() {
		clearLines();
		clearSheets();
	}

	void draw(bool flat = true) {
		if (flat) {
			// find out the correct order to draw the surfaces
			sheet[] sortedSheets = sort(this.sheets, less = sheetOrder);
			line[] fragments = getFragments(this.lines, this.sheets);
			line[] sortedLines = sort(fragments, lineOrder);

			sheet nextSheet = null;
			if (sortedSheets.length > 0) {
				nextSheet = sortedSheets.pop();
			}

			line nextLine = null;
			if (sortedLines.length > 0) {
				nextLine = sortedLines.pop();
			}

			while (nextSheet != null || nextLine != null) {
				if (nextSheet == null) {
					nextLine.draw(flat);
					nextLine = null;
				} else if (nextLine == null) {
					nextSheet.draw(flat);
					nextSheet = null;
				} else {
					if (nextSheet.distance() < nextLine.distance()) {
						nextLine.draw(flat);
						nextLine = null;
					} else {
						nextSheet.draw(flat);
						nextSheet = null;
					}
				}

				if (nextSheet == null && sortedSheets.length > 0) {
					nextSheet = sortedSheets.pop();
				}

				if (nextLine == null && sortedLines.length > 0) {
					nextLine = sortedLines.pop();
				}
			}
		} else {
			for (int i = 0; i < sheets.length; ++i) {
				sheets[i].draw(flat);
			}

			for (int i = 0; i < lines.length; ++i) {
				lines[i].draw(flat);
			}

			if (dividers) {
				for (int i = 0; i < lines.length; ++i) {
					if (lines[i].alwaysFlat || lines[i].radius < EPSILON) {
						continue;
					}

					for (int j = 0; j < sheets.length; ++j) {
						path3 p = lines[i].trace;
						surface s = surface(sheets[j].outline);
						real[][] times = intersections(p, s);

						for (int k = 0; k < times.length; ++k) {
							real time = times[k][0];
							triple location = point(p, time);
							triple direction = dir(p, time);
							path3 circ = scale3(lines[i].radius) * goodCircle;

							if (length(direction + Z) > EPSILON &&
								length(direction - Z) > EPSILON) {
								triple axis = cross(Z, direction);
								real amount = colatitude(direction);
								circ = rotate(amount, axis) * circ;
							}

							draw(
								shift(location) * circ,
								light = nolight
							);
						}
					}
				}
			}
		}

		triple[] corners;
		corners.push((minBounds.x, minBounds.y, minBounds.z));
        corners.push((minBounds.x, minBounds.y, maxBounds.z));
        corners.push((minBounds.x, maxBounds.y, minBounds.z));
        corners.push((minBounds.x, maxBounds.y, maxBounds.z));
		corners.push((maxBounds.x, minBounds.y, minBounds.z));
        corners.push((maxBounds.x, minBounds.y, maxBounds.z));
        corners.push((maxBounds.x, maxBounds.y, minBounds.z));
	    corners.push((maxBounds.x, maxBounds.y, maxBounds.z));

		for (int i = 0; i < corners.length; ++i) {
			if (flat) {
				draw(project(corners[i]), invisible);
			} else {
				draw(corners[i], invisible);
			}
		}
	}
}
