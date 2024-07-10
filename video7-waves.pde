int gridWidth = 540;  
int gridHeight = 960;  
float[][][] currentWave;  
float[][][] previousWave;  
float damping = 0.99;  
int frame = 0;  
color[] colors = {color(255, 69, 0), color(255, 165, 0), color(255, 255, 255), color(0, 255, 255), color(0, 0, 255)};  
  
void settings() {  
  size(gridWidth, gridHeight);  
}  
  
void setup() {  
  currentWave = new float[5][gridWidth][gridHeight];  
  previousWave = new float[5][gridWidth][gridHeight];  
  background(0);  
}  
  
void draw() {  
  loadPixels();  
  
  for (int k = 0; k < 5; k++) {  
    for (int x = 1; x < gridWidth - 1; x++) {  
      for (int y = 1; y < gridHeight - 1; y++) {  
        currentWave[k][x][y] = (previousWave[k][x-1][y] + previousWave[k][x+1][y] + previousWave[k][x][y-1] + previousWave[k][x][y+1]) / 2 - currentWave[k][x][y];  
        currentWave[k][x][y] *= damping;  
      }  
    }  
  }  
  
  for (int x = 0; x < gridWidth; x++) {  
    for (int y = 0; y < gridHeight; y++) {  
      float totalWaveValue = 0;  
      float[] waveValues = new float[5];  
      for (int k = 0; k < 5; k++) {  
        waveValues[k] = currentWave[k][x][y];  
        totalWaveValue += waveValues[k];  
      }  
        
      int colorValue = (int)(128 + totalWaveValue * 128);  
      colorValue = constrain(colorValue, 0, 255);  
        
      float[] weights = new float[5];  
      for (int k = 0; k < 5; k++) {  
        weights[k] = waveValues[k] / totalWaveValue;  
      }  
  
      color blendedColor = color(0);  
      for (int k = 0; k < 5; k++) {  
        blendedColor = lerpColor(blendedColor, colors[k], weights[k]);  
      }  
  
      int pixelIndex = x + y * width;  
      pixels[pixelIndex] = lerpColor(color(0), blendedColor, colorValue / 255.0);  
    }  
  }  
  
  updatePixels();  
  
  float[][][] temp = previousWave;  
  previousWave = currentWave;  
  currentWave = temp;  
  
  if (frame % 30 == 0) {  
    int[][] centers = {  
      {gridWidth / 4, gridHeight / 4},  
      {3 * gridWidth / 4, gridHeight / 4},  
      {gridWidth / 4, 3 * gridHeight / 4},  
      {3 * gridWidth / 4, 3 * gridHeight / 4},  
      {gridWidth / 2, gridHeight / 2}  
    };  
  
    for (int i = 0; i < centers.length; i++) {  
      int centerX = centers[i][0];  
      int centerY = centers[i][1];  
      previousWave[i][centerX][centerY] = 255;  
    }  
  }  
  
  String number_str = nf(frame, 4);  
  String im = "images/image" + number_str + ".jpg";  
  save(im);  
  frame++;  
}  
