color COLOR_TRUE = #CCFF90;
color COLOR_FALSE = #FF8A80;

class NeuralNetwork {
  private float bias0;
  private float bias1;
  private Neuron neuron10;
  private Neuron neuron11;
  private Neuron neuron20;
  private float learningRate = 0.3;

  NeuralNetwork() {
    neuron10 = new Neuron(new float[]{0.3, -2.2, -1.4});
    neuron11 = new Neuron(new float[]{-0.4, -0.1, 0.2});
    neuron20 = new Neuron(new float[]{-0.2, 0.5, -0.2});
  }

  void drawNeurons(float input0, float input1, int size) {
    float p10 = neuron10.run(new float[]{input0, input1, bias0});
    float p11 = neuron11.run(new float[]{input0, input1, bias0});
    float p20 = neuron20.run(new float[]{p10, p11, bias1});
    if (p20 > 0.5) {
      fill(COLOR_TRUE);
    } else {
      fill(COLOR_FALSE);
    }
    ellipse(input0, input1, size, size);
  }

  void setValueToUi() {
    CP5.getController("P10_WEIGHT0").setValue(neuron10.weight(0));
    CP5.getController("P10_WEIGHT1").setValue(neuron10.weight(1));
    CP5.getController("P10_WEIGHT2").setValue(neuron10.weight(2));
    CP5.getController("P11_WEIGHT0").setValue(neuron11.weight(0));
    CP5.getController("P11_WEIGHT1").setValue(neuron11.weight(1));
    CP5.getController("P11_WEIGHT2").setValue(neuron11.weight(2));
    CP5.getController("P20_WEIGHT0").setValue(neuron20.weight(0));
    CP5.getController("P20_WEIGHT1").setValue(neuron20.weight(1));
    CP5.getController("P20_WEIGHT2").setValue(neuron20.weight(2));
  }

  void learn(float input0, float input1, float correctValue) {
    float p10 = neuron10.run(new float[]{input0, input1, bias0});
    float p11 = neuron11.run(new float[]{input0, input1, bias0});
    float p20 = neuron20.run(new float[]{p10, p11, bias1});
    // 20 -> 10,11
    float deltaWeight20 = (correctValue - p20) * p20 * (1.0 - p20);
    float[] oldWeight20 = neuron20.weight();
    neuron20.weight(0, p10 * deltaWeight20 * learningRate);
    neuron20.weight(1, p11 * deltaWeight20 * learningRate);
    neuron20.weight(2, bias1 * deltaWeight20 * learningRate);
    // 10 -> 00,01
    float deltaWeight10 = deltaWeight20 * oldWeight20[0] * p10 * (1.0 - p10);
    neuron10.weight(0, input0 * deltaWeight10 * learningRate);
    neuron10.weight(1, input1 * deltaWeight10 * learningRate);
    neuron10.weight(2, bias0 * deltaWeight10 * learningRate);
    // 11 -> 00,01
    float deltaWeight11 = deltaWeight20 * oldWeight20[1] * p11 * (1.0 - p11);
    neuron11.weight(0, input0 * deltaWeight11 * learningRate);
    neuron11.weight(1, input1 * deltaWeight11 * learningRate);
    neuron11.weight(2, bias0 * deltaWeight11 * learningRate);
  }
}
