import controlP5.*;

ControlP5 CP5;

int sliderWidth = 100;
int sliderHeight = 15;
int rangeMin = -10;
int rangeMax = 10;

void setupUi() {
  int sliderPositionY = 10;
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
  stroke(150);
  line(-width / 2, 0, width / 2, 0);
  line(0, -height / 2, 0, height / 2);
  textFont(HIRAGINO_W0_20);
  textSize(20);
  fill(100);
  text("input0", width / 2 - 80, -5);
  text("input1", 5, -height / 2 + 30);
}
