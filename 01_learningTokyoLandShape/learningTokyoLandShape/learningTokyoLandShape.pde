ArrayList<TrainingDatum> TRAINING_DATA = new ArrayList<TrainingDatum>();

void setup() {
  size(1000, 1000, P2D);
  background(255);
  smooth();

  String[] datalines = loadStrings("../makeData/build/tokyoLandShape.csv");
  if (datalines != null) {
    for (int i = 0; i < datalines.length; i ++) {
      int[] data = int(split(datalines[i], ','));
      boolean flag = false;
      if (data[2] == 1) flag = true;
      TRAINING_DATA.add(new TrainingDatum(data[0], data[1], flag));
    }
  }
  drawTrainingData();
}

void drawTrainingData() {
  fill(0);
  for (int i = 0; i < TRAINING_DATA.size(); i++) {
    TrainingDatum td = TRAINING_DATA.get(i);
    if (!td.onLand) continue;
    rect(td.x, td.y, 1, 1);
  }
  noLoop();
}

void update() {
}

void draw() {
  update();
}
