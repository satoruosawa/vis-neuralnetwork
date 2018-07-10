class NeuralNetwork {
  private float bias0;
  private float bias1;
  private Neuron[] neuron1;
  private Neuron neuron2;
  private float learningRate = 0.3;

  NeuralNetwork() {
    bias0 = 1.0;
    bias1 = 1.0;
    neuron1 = new Neuron[NUM_MIDDLE_LAYER];
    float[] neuron2Weignts = new float[NUM_MIDDLE_LAYER + 1];
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      neuron1[i] = new Neuron(new float[]{
        random(-1.0, 1.0), random(-1.0, 1.0), random(-1.0, 1.0)
      });
      neuron2Weignts[i] = random(-1.0, 1.0);
    }
    neuron2Weignts[NUM_MIDDLE_LAYER] = random(-1.0, 1.0);
    neuron2 = new Neuron(neuron2Weignts);
  }

  void drawNeurons(float input0, float input1, int size) {
    float[] outputsN1 = new float[NUM_MIDDLE_LAYER + 1];
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      outputsN1[i] = neuron1[i].run(new float[]{input0, input1, bias0});
    }
    outputsN1[NUM_MIDDLE_LAYER] = bias1;
    float outputsN2 = neuron2.run(outputsN1);
    // fill((1 - outputsN2) * 255);
    if (outputsN2 > 0.5) {
      fill(0);
    } else {
      fill(255);
    }
    rect(input0 * SCALE, input1 * SCALE, size, size);
  }

  void setValueToUi() {
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      CP5.getController("P1" + str(i) + "_WEIGHT0").setValue(neuron1[i].weight(0));
      CP5.getController("P1" + str(i) + "_WEIGHT1").setValue(neuron1[i].weight(1));
      CP5.getController("P1" + str(i) + "_WEIGHT2").setValue(neuron1[i].weight(2));
    }
    for (int i = 0; i < NUM_MIDDLE_LAYER + 1; i++) {
      CP5.getController("P2_WEIGHT" + str(i)).setValue(neuron2.weight(i));
    }
  }

  void learn(float input0, float input1, float correctValue) {
    float[] outputsN1 = new float[NUM_MIDDLE_LAYER + 1];
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      outputsN1[i] = neuron1[i].run(new float[]{input0, input1, bias0});
    }
    outputsN1[NUM_MIDDLE_LAYER] = bias1;
    float outputN2 = neuron2.run(outputsN1);

    // 2 -> 1
    float deltaWeight2 = (correctValue - outputN2) * outputN2 * (1.0 - outputN2);
    float[] oldWeight2 = neuron2.weight();
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      neuron2.addWeight(i, outputsN1[i] * deltaWeight2 * learningRate);
    }
    neuron2.addWeight(NUM_MIDDLE_LAYER, bias1 * deltaWeight2 * learningRate);

    // 1 -> 0
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      float deltaWeight1 = deltaWeight2 * oldWeight2[i] * outputsN1[i] * (1.0 - outputsN1[i]);
      neuron1[i].addWeight(0, input0 * deltaWeight1 * learningRate);
      neuron1[i].addWeight(1, input1 * deltaWeight1 * learningRate);
      neuron1[i].addWeight(2, bias0 * deltaWeight1 * learningRate);
    }
  }
}
