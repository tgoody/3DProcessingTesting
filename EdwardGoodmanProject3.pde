Camera myCam = new Camera();
PShape miniMonster;
PShape wireMonster;

void setup(){
  
  size(800,500, P3D);
  background(180,180,180);
  myCam.setUpCamera();
  translate(400,400,50);
    for(int i = -100; i < 100; i+=10){
    
    if(i == 0){
      stroke(255,0,0);
      line(-100, 0, i, 100, 0, i);
      stroke(0,255,0);
      line(i, 0, -100, i, 0, 100);
    }
    
    else{
      stroke(255);
      line(-100, 0, i, 100, 0, i);
      line(i, 0, -100, i, 0, 100);
    }
  }
  
  
  
  
  miniMonster = loadShape("monster.obj");
  miniMonster.setFill(color(0,255,0));
  wireMonster = loadShape ("monster.obj");
  wireMonster.setFill(color(0, 0));
  wireMonster.setStroke(true);
  wireMonster.setStroke(color(1));
  wireMonster.setStrokeWeight(0.1f);
  
  
  

}

void draw(){

  myCam.Update(); //<>//

  translate(400, 400, 50);
  rotate(PI);
  pushMatrix();
  scale(0.5);
  shape(miniMonster, 0, 0);
  scale(2);
  shape(wireMonster, -75, 0);
  
  translate(-50,0,0);
  pushMatrix();
  
  beginShape(TRIANGLE_FAN);
  vertex(25, 25);
  
  endShape();
 
  popMatrix();
  popMatrix();
  
}
