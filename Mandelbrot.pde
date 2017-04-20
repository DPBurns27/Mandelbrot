int counter = 1;
int flip_counter_direction = -1;

void setup() {
  size(750, 750);
  // Need to change width/height because the pixel array increases with pixelDensity
  // pixelDensity(2);
  // width = 2*width;
  // height = 2*height;
  background(255);

}

void draw() {
  
  loadPixels();

  int divergence_n = counter;
  double tolerance = 20;

  double c_r = 0;
  double c_i = 0;

  for (int x = 0; x < width; ++x) {
    
    // Find the real component
    c_r = ((double)x/(width/3)) - 2;

    for (int y = 0; y < height; ++y) {

      // Find the imaginary component
      c_i = 1.5 - ((double)y/(height/3));

      //Reset holding variables
      double [] z = {0, 0};
      int i = 0;

      while ((z[1]*z[1] + z[0]*z[0] < tolerance) && (i < divergence_n)){
        i++;
        z = complexfunction(z[0],z[1],c_i,c_r);
      }

      pixels[(y)*width + x] = color(255*i/(divergence_n));

    }
  }
  updatePixels();

  if (counter == 50 || counter == 1){
    flip_counter_direction = -1*flip_counter_direction;
  }
  counter = counter + flip_counter_direction;
  //counter++;

  // ***Render***
  saveFrame("Output/####.bmp");
  if(frameCount == 100)
  exit();
  
}

double [] complexfunction(double z_i, double z_r, double c_i, double c_r) {
  double f1 = 2*z_i*z_r + c_i;
  double f2 = z_r*z_r - z_i*z_i + c_r;
  return new double [] {f1,f2};
}