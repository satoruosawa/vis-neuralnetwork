from PIL import Image
import os
import csv
import random

img = Image.open('tokyoLandShape.jpg')
width, height = img.size
img2 = Image.new('RGB', (width, height))

flag_array = []

# (0, 0)       ...  (width, 0)
# ...          ...  ...
# (0, height)  ...  (height, width)

for y in range(height):
  for x in range(width):
    if (img.getpixel((x, y))[0] == 0):
      flag_array.append([x, y, 1]) # is Tokyo
    else:
      flag_array.append([x, y, 0]) # is not Tokyo

def generateAll(writer, array):
  for y in range(height):
    for x in range(width):
      i = x + y * width
      writer.writerow(array[i])

def generateRandom(writer, array, rowNum):
  for i in range(rowNum):
      writer.writerow(array[random.randrange(height * width)])

folder_path = 'build'
if not os.path.exists(folder_path):
  os.mkdir(folder_path)
f = open(folder_path + '/tokyoLandShape.csv', 'w')
writer = csv.writer(f, lineterminator='\n')
generateAll(writer, flag_array)
# generateRandom(writer, flag_array, 1000)
f.close()
