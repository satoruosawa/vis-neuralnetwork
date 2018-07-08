class Neuron {
  private float weight[];
  private float bias;
  Neuron(float[] weight, float bias) {
    this.weight = weight;
    this.bias = bias;
  }

  float run(float[] x) {
    if (x.length != weight.length) {
      println("warn!! x length != weight length");
    }
    float reducedX = bias;
    for (int i = 0; i < weight.length; i++) {
      reducedX += weight[i] * x[i];
    }
    return sigmoid(reducedX);
  }

  float sigmoid(float x) {
    return 1.0 / (1.0 + exp(-x));
  }

  void weight(int index, float weight) { this.weight[index] = weight; }
  void bias(float bias) { this.bias = bias; }
  float weight(int index) { return weight[index]; }
  float bias() { return bias; }
}
