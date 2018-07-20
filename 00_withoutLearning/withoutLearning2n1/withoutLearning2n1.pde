PFont HIRAGINO_W0_20;
NeuralNetwork NEURAL_NETWORK;
float MAX = 10;
float MIN = -10;
float SCALE = 1;
int NUM_MIDDLE_LAYER = 2;

void setup() {
  size(1000, 1000, P2D);
  SCALE = width / (MAX - MIN);
  background(255);
  smooth();
  HIRAGINO_W0_20 = loadFont("HiraginoSans-W0-20.vlw");

  NEURAL_NETWORK = new NeuralNetwork();
  setupUi();
}

void update() {
  NEURAL_NETWORK.updateParametersFromUi();
}

void draw() {
  update();
  pushMatrix(); {
    translate(-MIN * SCALE, MAX * SCALE);
    for (int i = 0; i < 10000; i++) {
      float input0 = random(MIN, MAX);
      float input1 = random(MIN, MAX);
      noStroke();
      NEURAL_NETWORK.drawNeurons(input0, input1, 1);
    }
    drawAxis();
  } popMatrix();
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
