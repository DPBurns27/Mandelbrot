
double sqtwo = sqrt(2);
double isqtwo = 1/sqtwo;

void setup() {
  size(750, 500);
  pixelDensity(1);
  //translate(width/2,height/2);
  //scale(1,-1);
  blendMode(REPLACE);
  background(255);


  //loadPixels();

  int divergence_n = 100;
  double tolerance = 20;

  double c_r = 0;
  double c_i = 0;

  int counter = 0;

  int numtolhit = 0;

  for (int x = 0; x < width; ++x) {
    // Find the real component
    c_r = ((double)x/(width/3)) - 2;
    // print(c_i);
    //     print(", ");
    //     print(c_r);
    //     print("\n");

    for (int y = 0; y < height; ++y) {

      // Find the imaginary component
      c_i = 1 - ((double)y/(height/2));

      //Reset holding variables
      //double [] z_new = {1, 1};
      double [] z = {0, 0};
      int i = 0;

      while ((z[1]*z[1] + z[0]*z[0] < tolerance) && (i < divergence_n)){
        i++;
        z = complexfunction(z[0],z[1],c_i,c_r);
      }

      //if (i < divergence_n-1){
        stroke(255*i/(divergence_n));//*(i/divergence_n)
        point(x,y);
        counter = counter+i;
        numtolhit++;
      //}

      //point(x,x);
    }
  }
  print(counter);
  print("\n");
  print(numtolhit);
  //updatePixels();
  
  
  // c_i = 0.5;
  // c_r = 0.5;
  // for (int i = 0; i < 10; ++i) {

  //   z = complexfunction(z[0],z[1],c_i,c_r);
  //   print(z[1]);
  //   print(", ");
  //   print(z[0]);
  //   print("\n");
    
  // }

}

void draw() {
  
  // ***Render***
  // saveFrame("####.bmp");
  // if(frameCount == 500)
  // exit();
  
}

double [] complexfunction(double z_i, double z_r, double c_i, double c_r) {
  double f1 = 2*z_i*z_r + c_i;
  double f2 = z_r*z_r - z_i*z_i + c_r;
  return new double [] {f1,f2};
}