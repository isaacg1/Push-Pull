import sheet;

void makeRectangle(
	contents c, triple origin, triple u, triple v, pen color,
	int scoreCount = -1, pen scoreColor = black
) {
	sheet s = sheet(
		origin -- (origin + u) -- (origin + u + v) -- (origin + v) -- cycle,
		color
	);
	
	bool result = c.addSheet(s);

	if (result && scoreCount > 0) {
		for (int i = 0; i < scoreCount; ++i) {
			triple start = origin + ((i + 1) * u) / (scoreCount + 1);
			triple end = start + v;
			c.addLine(line(start -- end, scoreColor, 0, false, false, true));

			triple start = origin + ((i + 1) * v) / (scoreCount + 1);
			triple end = start + u;
			c.addLine(line(start -- end, scoreColor, 0, false, false, true));
		}
	}
}

void makeCube(
	contents c, triple a, triple b, pen color,
	int scoreCount = -1, pen scoreColor = black
) {
	triple xVec = (b.x - a.x, 0, 0);
	triple yVec = (0, b.y - a.y, 0);
	triple zVec = (0, 0, b.z - a.z);

	makeRectangle(c, a, +xVec, +yVec, color, scoreCount, scoreColor);
	makeRectangle(c, a, +xVec, +zVec, color, scoreCount, scoreColor);
	makeRectangle(c, a, +yVec, +zVec, color, scoreCount, scoreColor);
	makeRectangle(c, b, -xVec, -yVec, color, scoreCount, scoreColor);
	makeRectangle(c, b, -xVec, -zVec, color, scoreCount, scoreColor);
	makeRectangle(c, b, -yVec, -zVec, color, scoreCount, scoreColor);
}
