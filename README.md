# vis-neuralnetwork-processing

## 00_withoutLearning
Neuron: `sigmoid(input0 * weight0 + input1 * weight1 + ... + bias * weightN) -> output`
- withoutLearning221  
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/FSRDTXZ6OjA/0.jpg)](http://www.youtube.com/watch?v=FSRDTXZ6OjA)  
  Neuron10: `sigmoid(input0 * weight10_0 + input1 * weight10_1 + bias0 * weight10_2) -> output10`  
  Neuron11: `sigmoid(input0 * weight11_0 + input1 * weight11_1 + bias0 * weight11_2) -> output11`  
  Neuron20: `sigmoid(output10 * weight20_0 + output11 * weight20_1 + bias1 * weight20_2) -> output20`  
  Graph: x = input0, y = input1, plot = output20  

- withoutLearning231  
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/t7YKc6kC8H8/0.jpg)](http://www.youtube.com/watch?v=t7YKc6kC8H8)  
  Neuron10: `sigmoid(input0 * weight10_0 + input1 * weight10_1 + bias0 * weight10_2) -> output10`  
  Neuron11: `sigmoid(input0 * weight11_0 + input1 * weight11_1 + bias0 * weight11_2) -> output11`  
  Neuron12: `sigmoid(input0 * weight12_0 + input1 * weight12_1 + bias0 * weight12_2) -> output12`  
  Neuron20: `sigmoid(output10 * weight20_0 + output11 * weight20_1 + output12 * weight20_2 + bias1 * weight20_3) -> output20`  
  Graph: x = input0, y = input1, plot = output20
- withoutLearning241  
[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/9CijsnMtwJY/0.jpg)](http://www.youtube.com/watch?v=9CijsnMtwJY)  
  Neuron10: `sigmoid(input0 * weight10_0 + input1 * weight10_1 + bias0 * weight10_2) -> output10`  
  Neuron11: `sigmoid(input0 * weight11_0 + input1 * weight11_1 + bias0 * weight11_2) -> output11`  
  Neuron12: `sigmoid(input0 * weight12_0 + input1 * weight12_1 + bias0 * weight12_2) -> output12`  
  Neuron13: `sigmoid(input0 * weight13_0 + input1 * weight13_1 + bias0 * weight13_2) -> output13`  
  Neuron20: `sigmoid(output10 * weight20_0 + output11 * weight20_1 + output12 * weight20_2 + output13 * weight20_3 + bias1 * weight20_4) -> output20`  
  Graph: x = input0, y = input1, plot = output20

## 01_learningTokyoLandShape  
- makeData  
  Install a following library
  `$ pip install Pillow`  
  Use python3  
  `$ python makeData.py`

## 02_learningLandShape  
- makeData  
  Install a following library
  `$ pip install Pillow`  
  Put any jpg image data named 'landShape.jpg' in the makeData directory. The size should be 1000 * 1000 px.
  The land shape should be black. (condition: red is less than 128)
  Use python3  
  `$ python makeData.py`
- Start
  Put a line shape reference image named 'landShape.png' in the learningLandShape directory. The size should be 1000 * 1000 px.
  Play learningLandShape.pde
