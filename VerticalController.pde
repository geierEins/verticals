class VerticalController {

  Vertical[] verticals;
  int pointsPerVertical;
  int strokeAlpha, strokeSize;

  VerticalController(int numOfVerticals, int pointsPerVertical) {
    this.verticals = new Vertical[numOfVerticals];
    this.pointsPerVertical = pointsPerVertical;
    this.strokeAlpha = (int)random(100, 220);
    this.strokeSize = (int)random(1, 20);
    createVerticalsAndPutThemInArray();
  }

  void createVerticalsAndPutThemInArray() {
    int nextX;
    for (int i = 0; i < verticals.length; i++) {
      nextX = (int)(i*(width/verticals.length)+(width/verticals.length*0.5));
      verticals[i] = new Vertical(nextX, pointsPerVertical);
    }
  }

  void drawPointsOfEachVertical() {
    for (Vertical v : verticals) {
      v.drawNumberOfPoints();
    }
  }

  void drawLines() {
    int []rgb = new int[3];
    for (int p = 0; p < pointsPerVertical; p++) {
      // apply color scheme
      rgb = generateColorScheme2(p);
      for (int v = 0; v < verticals.length-1; v++) {
        strokeWeight(strokeSize);
        stroke(rgb[0], rgb[1], rgb[2], strokeAlpha);
        line(verticals[v].coos[p].x, verticals[v].coos[p].y, verticals[v+1].coos[p].x, verticals[v+1].coos[p].y);
      }
    }
  }

  int[] generateColorScheme1(int p) {
    int[] rgb = new int[3];
    if (p<=(pointsPerVertical/2)) {
      // red --> yellow
      rgb[0] = (int)map(p, 0, pointsPerVertical/2, 255, 255);
      rgb[1] = (int)map(p, 0, pointsPerVertical/2, 0, 255);
      rgb[2] = (int)map(p, 0, pointsPerVertical/2, 0, 0);
    } else {
      // yellow --> blue
      rgb[0] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 255, 0);
      rgb[1] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 255, 0);
      rgb[2] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 0, 255);
    }
    return rgb;
  }

  int[] generateColorScheme2(int p) {
    int[] rgb = new int[3];
    if (p<=(pointsPerVertical*0.333)) {
      // red --> yellow
      rgb[0] = (int)map(p, 0, pointsPerVertical/2, 255, 255);
      rgb[1] = (int)map(p, 0, pointsPerVertical/2, 0,   255);
      rgb[2] = (int)map(p, 0, pointsPerVertical/2, 0,   0);
    } else if (p<=pointsPerVertical*0.666) {
      // yellow --> green
      rgb[0] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 255, 0);
      rgb[1] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 255, 255);
      rgb[2] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 0,   0);
    } else {
      // green --> blue
      rgb[0] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 0,   0);
      rgb[1] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 255, 0);
      rgb[2] = (int)map(p, pointsPerVertical/2, pointsPerVertical, 0, 255);
    }
    return rgb;
  }
}
