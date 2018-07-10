PFont HIRAGINO10;
PFont HIRAGINO20;
ArrayList<TrainingDatum> TRAINING_DATA = new ArrayList<TrainingDatum>();
NeuralNetwork NEURAL_NETWORK;
float MAX = 1;
float MIN = -1;
float SCALE = 1;
PImage shapeImage;

void setup() {
  size(1000, 1000, P2D);
  SCALE = width / (MAX - MIN);
  background(255);
  smooth();
  HIRAGINO10 = loadFont("HiraginoSans-W0-10.vlw");
  HIRAGINO20 = loadFont("HiraginoSans-W0-20.vlw");
  shapeImage = loadImage("./tokyoLandShape.png");
  String[] datalines = loadStrings("../makeData/build/tokyoLandShape.csv");
  if (datalines != null) {
    for (int i = 0; i < datalines.length; i ++) {
      int[] data = int(split(datalines[i], ','));
      boolean flag = false;
      if (data[2] == 1) flag = true;
      TRAINING_DATA.add(new TrainingDatum(data[0], data[1], flag));
    }
  }
  // drawTrainingData();
  NEURAL_NETWORK = new NeuralNetwork();
  setupUi();
}

void drawTrainingData() {
  fill(0);
  for (int i = 0; i < TRAINING_DATA.size(); i++) {
    TrainingDatum td = TRAINING_DATA.get(i);
    if (!td.onLand) continue;
    rect(td.x, td.y, 1, 1);
  }
  // noLoop();
}

void update() {
  for (int i = 0; i < 1000; i++) {
    int trainingIndex = int(random(TRAINING_DATA.size()));
    TrainingDatum td = TRAINING_DATA.get(trainingIndex);
    float correctData = 1.0;
    if (!td.onLand) correctData = 0.0;
    float[] positionNormal = translateFromPixelScaleToNormal(td.x, td.y);
    NEURAL_NETWORK.learn(positionNormal[0], positionNormal[1], correctData);
  }
  NEURAL_NETWORK.setValueToUi();
}

void draw() {
  update();
  pushMatrix(); {
    translate(-MIN * SCALE, MAX * SCALE);
    noStroke();
    for (int i = 0; i < 1000; i++) {
      float input0 = random(MIN, MAX);
      float input1 = random(MIN, MAX);
      NEURAL_NETWORK.drawNeurons(input0, input1, 4);
    }
  } popMatrix();
  tint(#0000FF, 3);
  image(shapeImage, 0, 0);
  drawAxis();
}

void keyPressed() {
  switch (key) {
    case ' ':
      background(255);
      break;
    default:
      break;
  }
}
