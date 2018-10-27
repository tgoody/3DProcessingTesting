Camera myCam = new Camera();
PShape miniMonster;
PShape wireMonster;
boolean isKey;
PShape cube;

void setup(){
  
  size(800,500, P3D);
  
  myCam.setUpCamera();
  translate(400,400,50);
  pushMatrix();
  
  
  miniMonster = loadShape("monster.obj");
  miniMonster.setFill(color(175,175,0));
  PVector miniMonsPos = new PVector(0,-10,0);
  myCam.AddLookAtTarget(miniMonsPos);
  wireMonster = loadShape ("monster.obj");
  wireMonster.setFill(color(0, 0));
  wireMonster.setStroke(true);
  wireMonster.setStroke(color(1));
  wireMonster.setStrokeWeight(.5f);
  PVector wireMons = new PVector(75, -10, 0);
  myCam.AddLookAtTarget(wireMons);
  PVector cubes = new PVector(-100,0,0);
  myCam.AddLookAtTarget(cubes);
  PVector hexes = new PVector(-50,-10,0);
  myCam.AddLookAtTarget(hexes);
  myCam.currentTargetIndex = 0;

 
/////////////////////////////// Begin Cube Work
  
  cube = createShape();
  cube.beginShape(TRIANGLE);
  cube.setStroke(false);
  
  cube.fill(color(0,255,0));
  cube.vertex(-0.5,0.5,0.5);
  cube.vertex(-0.5,-0.5,0.5); //front one
  cube.vertex(0.5,0.5,0.5);
  
  cube.fill(color(255,255,0));
  cube.vertex(-0.5,-0.5,0.5);
  cube.vertex(0.5,0.5,0.5); //front two
  cube.vertex(0.5,-0.5,0.5);
  
  
  cube.fill(color(200));
  cube.vertex(0.5,0.5,0.5);
  cube.vertex(0.5,-0.5,0.5); //left side one
  cube.vertex(0.5,0.5,-0.5);
  
  cube.fill(color(0,0,255));
  cube.vertex(0.5,-0.5,0.5); //left side two
  cube.vertex(0.5,0.5,-0.5);
  cube.vertex(0.5,-0.5,-0.5);
  
  cube.fill(color(255));
  cube.vertex(0.5,0.5,-0.5);
  cube.vertex(0.5,-0.5,-0.5);
  cube.vertex(-0.5,0.5,-0.5);
  
  cube.fill(color(255,0,0));
  cube.vertex(0.5,-0.5,-0.5);
  cube.vertex(-0.5,0.5,-0.5);
  cube.vertex(-0.5,-0.5,-0.5);
  
  cube.fill(color(0,255,255));
  cube.vertex(-0.5,0.5,-0.5);
  cube.vertex(-0.5,-0.5,-0.5);
  cube.vertex(-0.5,0.5,0.5);
  
  cube.fill(color(255,100,0));
  cube.vertex(-0.5,-0.5,-0.5);
  cube.vertex(-0.5,0.5,0.5);
  cube.vertex(-0.5,-0.5,0.5);
  
  cube.fill(color(80,20,60));
  cube.vertex(-0.5,0.5,0.5);
  cube.vertex(-0.5,0.5,-0.5);
  cube.vertex(0.5,0.5,-0.5);
  
  cube.fill(color(0,150,255));
  cube.vertex(-0.5,0.5,0.5);
  cube.vertex(0.5,0.5,0.5);
  cube.vertex(0.5,0.5,-0.5);
  
   cube.fill(color(80,20,60));
  cube.vertex(-0.5,-0.5,0.5);
  cube.vertex(-0.5,-0.5,-0.5);
  cube.vertex(0.5,-0.5,-0.5);
  
  cube.fill(color(0,150,255));
  cube.vertex(-0.5,-0.5,0.5);
  cube.vertex(0.5,-0.5,0.5);
  cube.vertex(0.5,-0.5,-0.5);
  
  
  
  cube.endShape();

/////////////////////////////// End Cube Work

  isKey = false;
}

void draw(){

  
  colorMode(RGB, 255, 255, 255);
  background(180,180,180);
  
  
  if(keyPressed == true && !isKey){
    if(key == ' '){
      isKey = true;
      myCam.CycleTarget();
    }
  
  }
  
  
  
   for(int i = -100; i < 110; i+=10){
    
    if(i == 0){
      stroke(255,0,0);
      line(-100, 0, i, 100, 0, i);
      stroke(0,0,255);
      line(i, 0, -100, i, 0, 100);
    }
    
    else{
      stroke(255);
      line(-100, 0, i, 100, 0, i);
      line(i, 0, -100, i, 0, 100);
    }
  }
   
  myCam.Update();
  rotate(PI);
  scale(0.5);
  shape(miniMonster, 0, 0);
  scale(2);
  shape(wireMonster, -75, 0);
  

  for(int i = 0; i < myCam.myTargets.size(); i++){
    //print(i + ": ");
    //println(myCam.myTargets.get(i));

  }
  
  translate(50,0,0);
  pushMatrix();
  
  
  translate(-10,10,0);
  stroke(0);
  beginShape(TRIANGLE_FAN);
  fill(255,0,0);
  vertex(-10,0);
  fill(255,255,0);
  vertex((-10 * cos(radians(60.0f))), (-10 * sin(radians(60.0f))));
  fill(0,255,0);
  vertex((-10 * cos(radians(120.0f))), (-10 * sin(radians(120.0f))));
  fill(0,255,255);
  vertex(10,0);
  fill(0,0,255);
  vertex((-10 * cos(radians(240.0f))), (-10 * sin(radians(240.0f))));
  fill(255,0,255);
  vertex((-10 * cos(radians(300.0f))), (-10 * sin(radians(300.0f))));
  endShape();
  
  
  
  
  translate(20,0,0);
  stroke(0);
  strokeWeight(1.2);
  createFan(20);
  
  popMatrix();
  translate(-50,0,0); //now at origin
  
  translate(100,0,0);
  pushMatrix();
  scale(5,5,5);
  shape(cube);
  popMatrix();
  
  pushMatrix();
  translate(10,0,0);
  shape(cube);
  popMatrix();
  
  pushMatrix(); 
  translate(-10,0,0);
  scale(10,20,10);
  shape(cube);
  popMatrix();
  
}



void keyReleased(){
  
  if(key == ' '){
    isKey = false;
  }
  
  
}


void mouseWheel(MouseEvent event){
  
  float e = event.getCount();
  if (e > 0){
    myCam.Zoom(5.0);
  }
  else{myCam.Zoom(-5.0);}
  
}



void createFan(int sides){
   stroke(0);
  
  float ratio = 360/(float)sides;
  float currentRatio = 0.0;
  int radius = -10;
  colorMode(HSB, 360, 100, 100);
  beginShape(TRIANGLE_FAN);
  
  for(int i = 0; i < sides; i++){
    
    fill(i*18, 100, 100);
    vertex(radius*cos(radians(currentRatio)), radius*sin(radians(currentRatio))); //lines for 20 sided one
    currentRatio += ratio;
    
  }
  
  vertex(radius,0);
  endShape();
  
  
}
