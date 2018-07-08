class Neuron {
  private float weight1;
  private float weight2;
  private float bias;
  Neuron(float weight1, float weight2, float bias) {
    this.weight1 = weight1;
    this.weight2 = weight2;
    this.bias = bias;
  }

  float run(float x1, float x2) {
    return sigmoid(weight1 * x1 + weight2 * x2 + bias);
  }

  float sigmoid(float x) {
    return 1.0 / (1.0 + exp(-x));
  }

  void weight1(float weight1) { this.weight1 = weight1; }
  void weight2(float weight2) { this.weight2 = weight2; }
  void bias(float bias) { this.bias = bias; }
  float weight1() { return weight1; }
  float weight2() { return weight2; }
  float bias() { return bias; }
}
