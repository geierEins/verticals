class Vertical {

  PVector [] coos;

  Vertical(int x, int numOfPoints, int strategy) {
    if (strategy == -1) {
      coos = buildPVectorFromArray(x, sortYCoordinatesArray(
        buildRandomYcoordinatesArray(numOfPoints, (int)(height*0.1), (int)(height*0.9))));
    }
    if (strategy == 1) {
      coos = buildPVectorFromArray(x, sortYCoordinatesArray(
      buildDescYcoordinatesArray(numOfPoints, 0.08)));
    }
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
      takenHeight = yCoordinates[i];
      println("i: " + i + ", takenHeight: " + takenHeight);
      remainingHeight = (int)(remainingHeight - (remainingHeight * shrinkBy));
      println("i: " + i + ", remainingHeight: " + remainingHeight);
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
