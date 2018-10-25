Camera myCam = new Camera();
PShape miniMonster;
PShape wireMonster;

void setup(){
  
  size(800,500, P3D);
  
  myCam.setUpCamera();
  translate(400,400,50);
  pushMatrix();
  
  
  miniMonster = loadShape("monster.obj");
  miniMonster.setFill(color(255,255,0));
  PVector miniMonsPos = new PVector(0,0,0);
  myCam.AddLookAtTarget(miniMonsPos);
  wireMonster = loadShape ("monster.obj");
  wireMonster.setFill(color(0, 0));
  wireMonster.setStroke(true);
  wireMonster.setStroke(color(1));
  wireMonster.setStrokeWeight(0.1f);
  PVector wireMons = new PVector(75, 0, 0);
  myCam.AddLookAtTarget(wireMons);
  PVector hexes = new PVector(-50,0,0);
  myCam.AddLookAtTarget(hexes);
  myCam.currentTargetIndex = 0;

}

void draw(){

  background(180,180,180);
  
  if(key == ' '){
    myCam.CycleTarget();
  }
  
  
   for(int i = -100; i < 100; i+=10){
    
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
    print(i + ": ");
    println(myCam.myTargets.get(i));

  }
  
  beginShape(TRIANGLE_FAN);
  vertex(25, 25);
  vertex(25 * cos(radians(60.0f)), 25 * sin(radians(60.0f)));
  vertex(25 * cos(radians(120.0f)), 25 * sin(radians(120.0f)));
  vertex(-25,25);
  vertex(25 * cos(radians(240.0f)), 25 * sin(radians(240.0f)));
  vertex(25 * cos(radians(300.0f)), 25 * sin(radians(300.0f)));
  vertex(25, 25);
  endShape();
 
  
}
