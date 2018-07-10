class NeuralNetwork {
  private float bias0;
  private float bias1;
  private Neuron[] neuron1;
  private Neuron neuron10;
  private Neuron neuron11;
  private Neuron neuron12;
  private Neuron neuron13;
  private Neuron neuron20;
  private Neuron neuron2;
  private float learningRate = 0.3;
  private int numMiddleLayer = 2;

  NeuralNetwork(int numMiddleLayer) {
    bias0 = 1.0;
    bias1 = 1.0;
    this.numMiddleLayer = numMiddleLayer;
    neuron1 = new Neuron[numMiddleLayer];
    float[] neuron2Weignts = new float[numMiddleLayer + 1];
    for (int i = 0; i < numMiddleLayer; i++) {
      neuron1[i] = new Neuron(new float[]{
        random(-1.0, 1.0), random(-1.0, 1.0), random(-1.0, 1.0)
      });
      neuron2Weignts[i] = random(-1.0, 1.0);
    }
    neuron2Weignts[numMiddleLayer] = random(-1.0, 1.0);
    neuron2 = new Neuron(neuron2Weignts);


    neuron10 = new Neuron(new float[]{0.3, -2.2, -1.4});
    neuron11 = new Neuron(new float[]{-0.4, -0.1, 0.2});
    neuron12 = new Neuron(new float[]{0.4, -0.1, 0.2});
    neuron13 = new Neuron(new float[]{0.3, 0.5, 0.1});
    neuron20 = new Neuron(new float[]{-0.2, 0.5, 0.3, -0.1, -0.2});
  }

  void drawNeurons(float input0, float input1, int size) {
    float[] outputsN1 = new float[numMiddleLayer + 1];
    for (int i = 0; i < numMiddleLayer; i++) {
      outputsN1[i] = neuron1[i].run(new float[]{input0, input1, bias0});
    }
    outputsN1[numMiddleLayer] = bias1;
    float outputsN2 = neuron2.run(outputsN1);
    fill((1 - outputsN2) * 255);
    ellipse(input0 * SCALE, input1 * SCALE, size, size);


    float p10 = neuron10.run(new float[]{input0, input1, bias0});
    float p11 = neuron11.run(new float[]{input0, input1, bias0});
    float p12 = neuron12.run(new float[]{input0, input1, bias0});
    float p13 = neuron13.run(new float[]{input0, input1, bias0});
    float p20 = neuron20.run(new float[]{p10, p11, p12, p13, bias1});
    // fill((1 - p20) * 255);
    // ellipse(input0 * SCALE, input1 * SCALE, size, size);
  }

  void setValueToUi() {
    CP5.getController("P10_WEIGHT0").setValue(neuron10.weight(0));
    CP5.getController("P10_WEIGHT1").setValue(neuron10.weight(1));
    CP5.getController("P10_WEIGHT2").setValue(neuron10.weight(2));
    CP5.getController("P11_WEIGHT0").setValue(neuron11.weight(0));
    CP5.getController("P11_WEIGHT1").setValue(neuron11.weight(1));
    CP5.getController("P11_WEIGHT2").setValue(neuron11.weight(2));
    CP5.getController("P12_WEIGHT0").setValue(neuron12.weight(0));
    CP5.getController("P12_WEIGHT1").setValue(neuron12.weight(1));
    CP5.getController("P12_WEIGHT2").setValue(neuron12.weight(2));
    CP5.getController("P13_WEIGHT0").setValue(neuron13.weight(0));
    CP5.getController("P13_WEIGHT1").setValue(neuron13.weight(1));
    CP5.getController("P13_WEIGHT2").setValue(neuron13.weight(2));
    CP5.getController("P20_WEIGHT0").setValue(neuron20.weight(0));
    CP5.getController("P20_WEIGHT1").setValue(neuron20.weight(1));
    CP5.getController("P20_WEIGHT2").setValue(neuron20.weight(2));
    CP5.getController("P20_WEIGHT3").setValue(neuron20.weight(3));
    CP5.getController("P20_WEIGHT4").setValue(neuron20.weight(4));
  }

  void learn(float input0, float input1, float correctValue) {
    float[] outputsN1 = new float[numMiddleLayer + 1];
    for (int i = 0; i < numMiddleLayer; i++) {
      outputsN1[i] = neuron1[i].run(new float[]{input0, input1, bias0});
    }
    outputsN1[numMiddleLayer] = bias1;
    float outputN2 = neuron2.run(outputsN1);

    // 2 -> 1
    float deltaWeight2 = (correctValue - outputN2) * outputN2 * (1.0 - outputN2);
    float[] oldWeight2 = neuron2.weight();
    for (int i = 0; i < numMiddleLayer; i++) {
      neuron2.addWeight(i, outputsN1[i] * deltaWeight2 * learningRate);
    }
    neuron2.addWeight(numMiddleLayer, bias1 * deltaWeight2 * learningRate);

    // 1 -> 0
    for (int i = 0; i < numMiddleLayer; i++) {
      float deltaWeight1 = deltaWeight2 * oldWeight2[i] * outputsN1[i] * (1.0 - outputsN1[i]);
      neuron1[i].addWeight(0, input0 * deltaWeight1 * learningRate);
      neuron1[i].addWeight(1, input1 * deltaWeight1 * learningRate);
      neuron1[i].addWeight(2, bias0 * deltaWeight1 * learningRate);
    }

    float p10 = neuron10.run(new float[]{input0, input1, bias0});
    float p11 = neuron11.run(new float[]{input0, input1, bias0});
    float p12 = neuron12.run(new float[]{input0, input1, bias0});
    float p13 = neuron13.run(new float[]{input0, input1, bias0});
    float p20 = neuron20.run(new float[]{p10, p11, p12, p13, bias1});
    // 20 -> 10,11
    float deltaWeight20 = (correctValue - p20) * p20 * (1.0 - p20);
    float[] oldWeight20 = neuron20.weight();
    neuron20.addWeight(0, p10 * deltaWeight20 * learningRate);
    neuron20.addWeight(1, p11 * deltaWeight20 * learningRate);
    neuron20.addWeight(2, p12 * deltaWeight20 * learningRate);
    neuron20.addWeight(3, p13 * deltaWeight20 * learningRate);
    neuron20.addWeight(4, bias1 * deltaWeight20 * learningRate);
    // 10 -> 00,01
    float deltaWeight10 = deltaWeight20 * oldWeight20[0] * p10 * (1.0 - p10);
    neuron10.addWeight(0, input0 * deltaWeight10 * learningRate);
    neuron10.addWeight(1, input1 * deltaWeight10 * learningRate);
    neuron10.addWeight(2, bias0 * deltaWeight10 * learningRate);
    // 11 -> 00,01
    float deltaWeight11 = deltaWeight20 * oldWeight20[1] * p11 * (1.0 - p11);
    neuron11.addWeight(0, input0 * deltaWeight11 * learningRate);
    neuron11.addWeight(1, input1 * deltaWeight11 * learningRate);
    neuron11.addWeight(2, bias0 * deltaWeight11 * learningRate);
    // 11 -> 00,01
    float deltaWeight12 = deltaWeight20 * oldWeight20[2] * p12 * (1.0 - p12);
    neuron12.addWeight(0, input0 * deltaWeight12 * learningRate);
    neuron12.addWeight(1, input1 * deltaWeight12 * learningRate);
    neuron12.addWeight(2, bias0 * deltaWeight12 * learningRate);
    // 11 -> 00,01
    float deltaWeight13 = deltaWeight20 * oldWeight20[3] * p13 * (1.0 - p13);
    neuron13.addWeight(0, input0 * deltaWeight13 * learningRate);
    neuron13.addWeight(1, input1 * deltaWeight13 * learningRate);
    neuron13.addWeight(2, bias0 * deltaWeight13 * learningRate);
  }
}
