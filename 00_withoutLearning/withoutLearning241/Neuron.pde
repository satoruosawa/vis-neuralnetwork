class Neuron {
  private float weight[];
  Neuron(float[] weight) {
    this.weight = weight;
  }

  float run(float[] x) {
    if (x.length != weight.length) {
      println("warn!! x length != weight length");
    }
    float reducedX = 0;
    for (int i = 0; i < weight.length; i++) {
      reducedX += weight[i] * x[i];
    }
    return sigmoid(reducedX);
  }

  float sigmoid(float x) {
    return 1.0 / (1.0 + exp(-x));
  }

  void weight(int index, float weight) { this.weight[index] = weight; }
  float weight(int index) { return weight[index]; }
}
