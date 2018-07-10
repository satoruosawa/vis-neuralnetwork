float[] translateFromPixelScaleToNormal (float pixelX, float pixelY) {
  float x = pixelX / SCALE + MIN;
  float y = pixelY / SCALE + MIN;
  return new float[]{x, y};
}
