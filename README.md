# vis-neuralnetwork

## 00_withoutLearning
Neuron: `sigmoid(input0 * weight0 + input1 * weight1 + ... + bias) -> output`
- withoutLearning21  
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/FSRDTXZ6OjA/0.jpg)](http://www.youtube.com/watch?v=FSRDTXZ6OjA)  
  Neuron00: `sigmoid(input0 * weight00_0 + input1 * weight00_1 + bias00) -> output00`  
  Neuron01: `sigmoid(input0 * weight01_0 + input1 * weight01_1 + bias01) -> output01`  
  Neuron10: `sigmoid(output00 * weight10_0 + output01 * weight10_1 + bias10) -> output10`  
  Graph: x = input0, y = input1, plot = output10  

- withoutLearning31  
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/t7YKc6kC8H8/0.jpg)](http://www.youtube.com/watch?v=t7YKc6kC8H8)  
  Neuron00: `sigmoid(input0 * weight00_0 + input1 * weight00_1 + bias00) -> output00`  
  Neuron01: `sigmoid(input0 * weight01_0 + input1 * weight01_1 + bias01) -> output01`  
  Neuron02: `sigmoid(input0 * weight02_0 + input1 * weight02_1 + bias02) -> output02`  
  Neuron10: `sigmoid(output00 * weight10_0 + output01 * weight10_1 + output02 * weight10_2 + bias10) -> output10`  
  Graph: x = input0, y = input1, plot = output10
- withoutLearning41  
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/9CijsnMtwJY/0.jpg)](http://www.youtube.com/watch?v=9CijsnMtwJY)  
  Neuron00: `sigmoid(input0 * weight00_0 + input1 * weight00_1 + bias00) -> output00`  
  Neuron01: `sigmoid(input0 * weight01_0 + input1 * weight01_1 + bias01) -> output01`  
  Neuron02: `sigmoid(input0 * weight02_0 + input1 * weight02_1 + bias02) -> output02`  
  Neuron03: `sigmoid(input0 * weight03_0 + input1 * weight03_1 + bias03) -> output03`  
  Neuron10: `sigmoid(output00 * weight10_0 + output01 * weight10_1 + output02 * weight10_2 + output03 * weight10_3 + bias10) -> output10`  
  Graph: x = input0, y = input1, plot = output10
