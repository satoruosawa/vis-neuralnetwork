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
  CP5.addSlider("P10_WEIGHT0")
    .setLabel("P10 weight0")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P10_WEIGHT1")
    .setLabel("P10 weight1")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P10_WEIGHT2")
    .setLabel("P10 weight2")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P11_WEIGHT0")
    .setLabel("P11 weight0")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P11_WEIGHT1")
    .setLabel("P11 weight1")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P11_WEIGHT2")
    .setLabel("P11 weight2")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P12_WEIGHT0")
    .setLabel("P12 weight0")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P12_WEIGHT1")
    .setLabel("P12 weight1")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P12_WEIGHT2")
    .setLabel("P12 weight2")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P20_WEIGHT0")
    .setLabel("P20 weight0")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P20_WEIGHT1")
    .setLabel("P20 weight1")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P20_WEIGHT2")
    .setLabel("P20 weight2")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P20_WEIGHT3")
    .setLabel("P20 weight3")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;

  NEURAL_NETWORK.setValueToUi();
}

void drawAxis() {
  stroke(150);
  line(-width / 2, 0, width / 2, 0);
  line(0, -height / 2, 0, height / 2);
  textFont(HIRAGINO20);
  textSize(20);
  fill(100);
  text("input0", width / 2 - 80, -5);
  text("input1", 5, -height / 2 + 30);
}
