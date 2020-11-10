int cols,rows,h,w;
int scl = 5;
Table table;

void setup() {
  size(600,600,P3D);
  w = 20000;
  h = 20000;
  cols = w / scl;
  rows = h / scl;
  table = loadTable("Data_Table.csv", "header");
  
  //for (TableRow row : table.rows()) {

  //float lat = row.getFloat("Latitude");
  //float lon = row.getFloat("Longitude");
  //float slope = row.getFloat("Slope");
  //int h = row.getInt("Height");
 // }
}



void draw() {
  //visual setup
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2, -400);
  rotateX(PI/3);

  //translate(-w/2, -h/2);
  
  //creating the mesh that will become the terrain
   beginShape(TRIANGLE_STRIP);
  for (TableRow row : table.rows()) {
    float lat = row.getFloat("Latitude");
    float lon = row.getFloat("Longitude");
    float slope = row.getFloat("Slope");
    int h = row.getInt("Height");
     
     float y = lat;
     float x = lon;
     
     vertex(x*scl, y*scl, h*scl);
    // vertex(x*scl, (y-1)*scl);
      
    }
    endShape();
    
    noLoop();
  }
  
  
