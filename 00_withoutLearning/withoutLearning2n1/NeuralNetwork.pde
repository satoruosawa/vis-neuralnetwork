color COLOR_TRUE = #000000;
color COLOR_FALSE = #FFFFFF;

class NeuralNetwork {
  private float bias0;
  private float bias1;
  private Neuron[] neuron1;
  private Neuron neuron2;

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

  void updateParametersFromUi() {
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      neuron1[i].weight(0, CP5.getController("P1" + str(i) + "_WEIGHT0").getValue());
      neuron1[i].weight(1, CP5.getController("P1" + str(i) + "_WEIGHT1").getValue());
      neuron1[i].weight(2, CP5.getController("P1" + str(i) + "_WEIGHT2").getValue());
    }
    for (int i = 0; i < NUM_MIDDLE_LAYER + 1; i++) {
      neuron2.weight(i, CP5.getController("P2_WEIGHT" + str(i)).getValue());
    }
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

  void drawNeurons(float input0, float input1, int size) {
    float[] outputsN1 = new float[NUM_MIDDLE_LAYER + 1];
    for (int i = 0; i < NUM_MIDDLE_LAYER; i++) {
      outputsN1[i] = neuron1[i].run(new float[]{input0, input1, bias0});
    }
    outputsN1[NUM_MIDDLE_LAYER] = bias1;
    float outputsN2 = neuron2.run(outputsN1);
    // fill((1 - outputsN2) * 255);
    if (outputsN2 > 0.5) {
      fill(COLOR_TRUE);
    } else {
      fill(COLOR_FALSE);
    }
    rect(input0 * SCALE, input1 * SCALE, size, size);
  }
}
