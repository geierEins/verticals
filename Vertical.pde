class Vertical {

  PVector [] coos;

  Vertical(int x, int numOfPoints) {
    coos = buildPVectorFromArray(x, sortYCoordinatesArray(
      //buildRandomYcoordinatesArray(numOfPoints, (int)(height*0.1), (int)(height*0.9))));
      buildDescYcoordinatesArray(numOfPoints, 0.3333, (int)(height*0.1), (int)(height*1))));
  }

  int[] buildRandomYcoordinatesArray(int numOfPoints, int from, int to) {
    int[] yCoordinates = new int[numOfPoints];
    for (int i = 0; i < numOfPoints; i++) {
      yCoordinates[i] = (int)random(from, to);
    }
    return yCoordinates;
  }

  int[] buildDescYcoordinatesArray(int numOfPoints, float shrinkBy) {
    int remainingHeight = height;
    int takenHeight = 0;
    int[] yCoordinates = new int[numOfPoints];
    for (int i = 0; i < numOfPoints; i++) {
      yCoordinates[i] = (int)(remainingHeight * shrinkBy) + takenHeight;
      println("i: " + i + ", y: " + yCoordinates[i]);
      takenHeight *= shrinkBy;
      takenHeight = height-remainingHeight;
    }
    return yCoordinates;
  }

  int[] sortYCoordinatesArray(int[] yCoordinates) {
    return sort(yCoordinates);
  }

  PVector[] buildPVectorFromArray(int x, int[] yCoordinates) {
    PVector[] coos = new PVector[yCoordinates.length];
    for (int i = 0; i < yCoordinates.length; i++) {
      coos[i] = new PVector(x, yCoordinates[i]);
    }
    return coos;
  }

  void drawNumberOfPoints() {
    for (int i = 0; i < coos.length; i++) {
      fill(255);
      text(i, coos[i].x, coos[i].y);
    }
  }
}
