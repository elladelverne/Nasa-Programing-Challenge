int cols,rows,h,w;
int scl = 10;
Table table;

void setup() {
  size(600,600,P3D);
  table = loadTable("Data_Table.csv", "header");

}

void draw() {
  //visual setup
  background(0);
  stroke(255);
  noFill();
  
  translate(width/2, height/2);
  rotateX(PI/3);
  //creating the mesh that will become the terrain
   beginShape(TRIANGLE_STRIP);
  for (int i = 0; i<table.getRowCount(); i++) {
    TableRow row = table.getRow(i);
    float lat = row.getFloat("Latitude");
    float lon = row.getFloat("Longitude");
    float slope = row.getFloat("Slope");
    int h = row.getInt("Height");    
    
    float y = lat;
    float x = lon;
    vertex(x*scl, y*scl, h*scl);
    
    TableRow newRow = table.getRow(i++);
    float lat2 = newRow.getFloat("Latitude");

    float y2 = lat2;

    vertex(x*scl, y2*scl);
      
    }
    endShape();
    
    noLoop();
  }
  
  
