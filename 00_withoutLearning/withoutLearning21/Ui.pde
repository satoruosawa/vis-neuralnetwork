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
  CP5.addSlider("P00_WEIGHT0")
    .setLabel("P00 weight0")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P00_WEIGHT1")
    .setLabel("P00 weight1")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P00_BIAS")
    .setLabel("P00 bias")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P01_WEIGHT0")
    .setLabel("P01 weight0")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P01_WEIGHT1")
    .setLabel("P01 weight1")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
  CP5.addSlider("P01_BIAS")
    .setLabel("P01 bias")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;
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
  CP5.addSlider("P10_BIAS")
    .setLabel("P10 bias")
    .setPosition(10, sliderPositionY)
    .setSize(sliderWidth, sliderHeight)
    .setRange(rangeMin, rangeMax);
  sliderPositionY += 20;

  setValue();
}

void setValue() {
  CP5.getController("P00_WEIGHT0").setValue(NEURON_0_0.weight(0));
  CP5.getController("P00_WEIGHT1").setValue(NEURON_0_0.weight(1));
  CP5.getController("P00_BIAS").setValue(NEURON_0_0.bias());
  CP5.getController("P01_WEIGHT0").setValue(NEURON_0_1.weight(0));
  CP5.getController("P01_WEIGHT1").setValue(NEURON_0_1.weight(1));
  CP5.getController("P01_BIAS").setValue(NEURON_0_1.bias());
  CP5.getController("P10_WEIGHT0").setValue(NEURON_1_0.weight(0));
  CP5.getController("P10_WEIGHT1").setValue(NEURON_1_0.weight(1));
  CP5.getController("P10_BIAS").setValue(NEURON_1_0.bias());
}

void drawAxis() {
  stroke(150);
  line(-width / 2, 0, width / 2, 0);
  line(0, -height / 2, 0, height / 2);
  textFont(HIRAGINO20);
  textSize(20);
  fill(100);
  text("x0", width / 2 - 30, -5);
  text("x1", 5, -height / 2 + 30);
}
