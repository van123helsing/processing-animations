int gridWidth = 540;  
int gridHeight = 960;  
float[][] currentWave;  
float[][] previousWave;  
float damping = 0.99;  
int frame = 0;  
  
void settings() {  
  size(gridWidth, gridHeight);  
}  
  
void setup() {  
  currentWave = new float[gridWidth][gridHeight];  
  previousWave = new float[gridWidth][gridHeight];  
  background(0);  
}  
  
void draw() {  
  loadPixels();  
    
  for (int x = 1; x < gridWidth - 1; x++) {  
    for (int y = 1; y < gridHeight - 1; y++) {  
      currentWave[x][y] = (previousWave[x-1][y] + previousWave[x+1][y] + previousWave[x][y-1] + previousWave[x][y+1]) / 2 - currentWave[x][y];  
      currentWave[x][y] *= damping;  
    }  
  }  
    
  for (int x = 0; x < gridWidth; x++) {  
    for (int y = 0; y < gridHeight; y++) {  
      int colorValue = (int)(128 + currentWave[x][y] * 128);  
      colorValue = constrain(colorValue, 0, 255);  
      int pixelIndex = x + y * width;  
      pixels[pixelIndex] = color(colorValue);  
    }  
  }  
  updatePixels();  
    
  float[][] temp = previousWave;  
  previousWave = currentWave;  
  currentWave = temp;  
    
  if (frame % 30 == 0) {  
    int centerX = gridWidth / 2;  
    int centerY = gridHeight / 2;  
    previousWave[centerX][centerY] = 255;  
  }  
    
  String number_str = nf(frame, 4);  
  String im = "images/image" + number_str + ".jpg";  
  save(im);  
  frame++;  
}  