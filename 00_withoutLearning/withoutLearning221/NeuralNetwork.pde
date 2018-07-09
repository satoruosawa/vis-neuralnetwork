color COLOR_TRUE = #CCFF90;
color COLOR_FALSE = #FF8A80;

class NeuralNetwork {
  float biasIn;
  float bias0;
  Neuron neuron00;
  Neuron neuron01;
  Neuron neuron10;

  NeuralNetwork() {
    biasIn = 1.0;
    bias0 = 1.0;
    neuron00 = new Neuron(new float[]{0.3, -2.2, -1.4});
    neuron01 = new Neuron(new float[]{-0.4, -0.1, 0.2});
    neuron10 = new Neuron(new float[]{-0.2, 0.5, -0.2});
  }

  void updateParametersFromUi() {
    neuron00.weight(0, CP5.getController("P00_WEIGHT0").getValue());
    neuron00.weight(1, CP5.getController("P00_WEIGHT1").getValue());
    neuron00.weight(2, CP5.getController("P00_WEIGHT2").getValue());
    neuron01.weight(0, CP5.getController("P01_WEIGHT0").getValue());
    neuron01.weight(1, CP5.getController("P01_WEIGHT1").getValue());
    neuron01.weight(2, CP5.getController("P01_WEIGHT2").getValue());
    neuron10.weight(0, CP5.getController("P10_WEIGHT0").getValue());
    neuron10.weight(1, CP5.getController("P10_WEIGHT1").getValue());
    neuron10.weight(2, CP5.getController("P10_WEIGHT2").getValue());
  }

  void setValueToUi() {
    CP5.getController("P00_WEIGHT0").setValue(neuron00.weight(0));
    CP5.getController("P00_WEIGHT1").setValue(neuron00.weight(1));
    CP5.getController("P00_WEIGHT2").setValue(neuron00.weight(2));
    CP5.getController("P01_WEIGHT0").setValue(neuron01.weight(0));
    CP5.getController("P01_WEIGHT1").setValue(neuron01.weight(1));
    CP5.getController("P01_WEIGHT2").setValue(neuron01.weight(2));
    CP5.getController("P10_WEIGHT0").setValue(neuron10.weight(0));
    CP5.getController("P10_WEIGHT1").setValue(neuron10.weight(1));
    CP5.getController("P10_WEIGHT2").setValue(neuron10.weight(2));
  }

  void drawNeurons(float input0, float input1, int size) {
    float p00 = neuron00.run(new float[]{input0, input1, biasIn});
    float p01 = neuron01.run(new float[]{input0, input1, biasIn});
    float output = neuron10.run(new float[]{p00, p01, bias0});
    if (output > 0.5) {
      fill(COLOR_TRUE);
    } else {
      fill(COLOR_FALSE);
    }
    ellipse(input0 * SCALE, input1 * SCALE, size, size);
  }

}
