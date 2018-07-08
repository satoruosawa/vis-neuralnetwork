PFont HIRAGINO10;
PFont HIRAGINO20;
Neuron NEURON_0_0;
Neuron NEURON_0_1;
Neuron NEURON_1_0;
float MAX = 10;
float MIN = -10;
float SCALE = 1;
color COLOR_TRUE = #CCFF90;
color COLOR_FALSE = #FF8A80;
String MOUSE_X_ASSIGN = "P00 undefined";
String MOUSE_Y_ASSIGN = "P00 undefined";
int MOUSE_MODE = 0;

void setup() {
  size(1000, 1000, P2D);
  SCALE = width / (MAX - MIN);
  background(255);
  smooth();
  HIRAGINO10 = loadFont("HiraginoSans-W0-10.vlw");
  HIRAGINO20 = loadFont("HiraginoSans-W0-20.vlw");

  NEURON_0_0 = new Neuron(0.3, -2.2, -1.4);
  NEURON_0_1 = new Neuron(-0.4, -0.1, 0.2);
  NEURON_1_0 = new Neuron(-0.2, 0.5, -0.2);

  setupUi();
}

void update() {
  updateParameters();
}

void draw() {
  update();
  pushMatrix(); {
    translate(-MIN * SCALE, MAX * SCALE);
    for (int i = 0; i < 10000; i++) {
      float x1 = random(MIN, MAX);
      float x2 = random(MIN, MAX);
      noStroke();
      drawNeuron(x1, x2, 4);
    }
    drawAxis();
    stroke(150);
    strokeWeight(1);
    drawNeuron(0, 0, 15);
    drawNeuron(0, 1, 15);
    drawNeuron(1, 0, 15);
    drawNeuron(1, 1, 15);
  } popMatrix();
}

void drawNeuron(float x1, float x2, float size) {
  float p00 = NEURON_0_0.run(x1, x2);
  float p01 = NEURON_0_1.run(x1, x2);
  float p10 = NEURON_1_0.run(p00, p01);
  if (p10 > 0.5) {
    fill(COLOR_TRUE);
  } else {
    fill(COLOR_FALSE);
  }
  ellipse(x1 * SCALE, -x2 * SCALE, size, size);
}

void updateParameters() {
  NEURON_0_0.weight1(CP5.getController("P00_WEIGHT1").getValue());
  NEURON_0_0.weight2(CP5.getController("P00_WEIGHT2").getValue());
  NEURON_0_0.bias(CP5.getController("P00_BIAS").getValue());
  NEURON_0_1.weight1(CP5.getController("P01_WEIGHT1").getValue());
  NEURON_0_1.weight2(CP5.getController("P01_WEIGHT2").getValue());
  NEURON_0_1.bias(CP5.getController("P01_BIAS").getValue());
  NEURON_1_0.weight1(CP5.getController("P10_WEIGHT1").getValue());
  NEURON_1_0.weight2(CP5.getController("P10_WEIGHT2").getValue());
  NEURON_1_0.bias(CP5.getController("P10_BIAS").getValue());
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
