int[][] grid;   //<>//
int gridWidth = 540;  
int gridHeight = 960;  
int particleCount = 250000;  
ArrayList<PVector> particles;  
int frame = 0;  
color startColor = color(255, 0, 0); // Red  
color endColor = color(0, 0, 255);   // Blue  
  
void settings() {  
  size(gridWidth, gridHeight);  // This should be in settings()  
}  
  
void setup() {  
  background(0);  
  grid = new int[gridWidth][gridHeight];  
  
  // Seed the initial particle at the center of the grid  
  int centerX = gridWidth / 2;  
  int centerY = gridHeight / 2;  
  grid[centerX][centerY] = color(255); // Initial particle is white  
  
  particles = new ArrayList<PVector>();  
  
  for (int i = 0; i < particleCount; i++) {  
    particles.add(new PVector(random(gridWidth), random(gridHeight)));  
  }  
}  
  
void draw() {  
  background(0);  
  loadPixels();  
  
  // Calculate the current color based on the frame count  
  float t = map(frame, 0, 300, 0, 1); // Assuming the transition takes 1000 frames  
  color currentColor = lerpColor(startColor, endColor, t);  
  
  for (int i = 0; i < particles.size(); i++) {  
    PVector p = particles.get(i);  
  
    // Check if particle is adjacent to any occupied cell  
    if (isAdjacent(p)) {  
      int x = int(p.x);  
      int y = int(p.y);  
      grid[x][y] = currentColor; // Store the current color in the grid  
      particles.remove(i);  
      i--;  
    } else {  
      // Perform a random walk  
      p.x += random(-1, 2);  
      p.y += random(-1, 2);  
  
      // If particle hits the border, reinitialize it  
      if (p.x <= 0 || p.x >= gridWidth - 1 || p.y <= 0 || p.y >= gridHeight - 1) {  
        particles.set(i, new PVector(random(gridWidth), random(gridHeight)));  
      }  
    }  
  }  
  
  // Draw the grid  
  for (int x = 0; x < gridWidth; x++) {  
    for (int y = 0; y < gridHeight; y++) {  
      if (grid[x][y] != 0) { // Check if the cell is occupied  
        int pixelIndex = x + y * width;  
        pixels[pixelIndex] = grid[x][y]; // Use the stored color   //<>//
      }  
    }  
  }  
  updatePixels();  
  
  // Stop the sketch when all particles have aggregated  
  String number_str = nf(frame, 4);  
  String im = "images/image" + number_str + ".jpg";  
  save(im);  
  frame++;  
}  
  
boolean isAdjacent(PVector p) {  
  int x = int(p.x);  
  int y = int(p.y);  
  
  for (int dx = -1; dx <= 1; dx++) {  
    for (int dy = -1; dy <= 1; dy++) {  
      if (dx == 0 && dy == 0) continue;  
      int nx = x + dx;  
      int ny = y + dy;  
      if (nx >= 0 && nx < gridWidth && ny >= 0 && ny < gridHeight) {  
        if (grid[nx][ny] != 0) { // Check if the cell is occupied  
          return true;  
        }  
      }  
    }  
  }  
  return false;  
}  
