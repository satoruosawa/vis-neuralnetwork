from PIL import Image
import os
import csv
import random

img = Image.open('landShape.jpg')
width, height = img.size

flag_array = []

# (0, 0)       ...  (width, 0)
# ...          ...  ...
# (0, height)  ...  (height, width)

for y in range(height):
  for x in range(width):
    if (img.getpixel((x, y))[0] < 128):
      flag_array.append([x, y, 1]) # is on the land
    else:
      flag_array.append([x, y, 0]) # is not on the land

def generateAll(writer, array):
  for y in range(height):
    for x in range(width):
      i = x + y * width
      writer.writerow(array[i])

folder_path = 'build'
if not os.path.exists(folder_path):
  os.mkdir(folder_path)
f = open(folder_path + '/landShape.csv', 'w')
writer = csv.writer(f, lineterminator='\n')
generateAll(writer, flag_array)
f.close()
