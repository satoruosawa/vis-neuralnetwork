import controlP5.*;

ControlP5 CP5;

int sliderWidth = 50;
int sliderHeight = 15;
int rangeMin = -50;
int rangeMax = 50;

void setupUi() {
  int sliderPositionY = 30;
  CP5 = new ControlP5(this);
  CP5.setColorCaptionLabel(color(100));
  for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
    CP5.addSlider("P1" + str(i) + "_WEIGHT0")
      .setLabel("P1" + str(i) + " weight0")
      .setPosition(10, sliderPositionY)
      .setSize(sliderWidth, sliderHeight)
      .setRange(rangeMin, rangeMax);
    sliderPositionY += 20;
    CP5.addSlider("P1" + str(i) + "_WEIGHT1")
      .setLabel("P1" + str(i) + " weight1")
      .setPosition(10, sliderPositionY)
      .setSize(sliderWidth, sliderHeight)
      .setRange(rangeMin, rangeMax);
    sliderPositionY += 20;
    CP5.addSlider("P1" + str(i) + "_WEIGHT2")
      .setLabel("P1" + str(i) + " weight2")
      .setPosition(10, sliderPositionY)
      .setSize(sliderWidth, sliderHeight)
      .setRange(rangeMin, rangeMax);
    sliderPositionY += 20;
  }

  for (int i = 0; i < NUM_MIDDLE_LAYER + 1; i++) {
    CP5.addSlider("P2_WEIGHT" + str(i))
      .setLabel("P2 weight" + str(i))
      .setPosition(10, sliderPositionY)
      .setSize(sliderWidth, sliderHeight)
      .setRange(rangeMin, rangeMax);
    sliderPositionY += 20;
  }
  NEURAL_NETWORK.setValueToUi();
}

void drawAxis() {
  fill(255);
  noStroke();
  rect(width - 85, height / 2 - 21, 70, 20);
  rect(width / 2 + 1, 14, 67, 21);
  stroke(150);
  line(0, height / 2, width, height / 2);
  line(width / 2, 0, width / 2, height);
  textFont(HIRAGINO_W0_20);
  textSize(20);
  fill(100);
  text("input0", width - 80, height / 2 - 5);
  text("input1", width / 2 + 5, 30);
}

void drawLearningCount() {
  fill(255);
  noStroke();
  rect(10, 5, 50, 20);
  textFont(HIRAGINO_W2_10);
  textSize(10);
  fill(0);
  text(LEARNING_COUNT, 10, 20);
}

void drawLearning() {
  textFont(HIRAGINO_W0_20);
  textSize(20);
  fill(0);
  text("LEARNING", width / 2 - 50, height / 2 + 8);
}
