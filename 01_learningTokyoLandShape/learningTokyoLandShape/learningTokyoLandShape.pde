PFont HIRAGINO_W0_10;
PFont HIRAGINO_W0_20;
PFont HIRAGINO_W2_10;
ArrayList<TrainingDatum> TRAINING_DATA = new ArrayList<TrainingDatum>();
NeuralNetwork NEURAL_NETWORK;
float MAX = 1;
float MIN = -1;
float SCALE = 1;
int NUM_MIDDLE_LAYER = 2;
boolean IS_LEARNING = false;
int LEARNING_COUNT = 0;
PImage shapeImage;

void setup() {
  size(1000, 1000, P2D);
  SCALE = width / (MAX - MIN);
  background(255);
  smooth();
  HIRAGINO_W0_10 = loadFont("HiraginoSans-W0-10.vlw");
  HIRAGINO_W0_20 = loadFont("HiraginoSans-W0-20.vlw");
  HIRAGINO_W2_10 = loadFont("HiraginoSans-W2-10.vlw");
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
  if (!IS_LEARNING) { return; }
  for (int i = 0; i < 10000; i++) {
    int trainingIndex = int(random(TRAINING_DATA.size()));
    TrainingDatum td = TRAINING_DATA.get(trainingIndex);
    float correctData = 1.0;
    if (!td.onLand) correctData = 0.0;
    float[] positionNormal = translateFromPixelScaleToNormal(td.x, td.y);
    NEURAL_NETWORK.learn(positionNormal[0], positionNormal[1], correctData);
    LEARNING_COUNT++;
  }
  NEURAL_NETWORK.setValueToUi();
  drawLearningCount();
}

void draw() {
  update();
  if (IS_LEARNING) { return; }
  pushMatrix(); {
    translate(-MIN * SCALE, MAX * SCALE);
    noStroke();
    for (int i = 0; i < 1000; i++) {
      float input0 = random(MIN, MAX);
      float input1 = random(MIN, MAX);
      NEURAL_NETWORK.drawNeurons(input0, input1, 1);
    }
  } popMatrix();
  tint(#0000FF, 3);
  image(shapeImage, 0, 0);
  drawLearningCount();
  drawAxis();
}

void keyPressed() {
  switch (key) {
    case ' ':
      background(255);
      break;
    case 'l':
      IS_LEARNING = !IS_LEARNING;
      if (IS_LEARNING) {
        noStroke();
        fill(255);
        rect(width / 2 - 60, height / 2 - 21, 120, 42);
        fill(0, 100);
        rect(0, 0, width, height);
        drawLearning();
      } else {
        background(255);
      }
      break;
    default:
      break;
  }
}
