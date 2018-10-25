

class Camera{
  
  ArrayList<PVector> myTargets = new ArrayList<PVector>();
  PVector currentTarget;
  int currentTargetIndex;
  
  void setUpCamera(){
    perspective(radians(50.0f), float(width)/float(height), 0.1, 1000);
    
  }
  
  void Update(){
    
    currentTarget = myTargets.get(currentTargetIndex);
    
    float phi = map(mouseX, 0, width-1, 0, 360);
    float theta = map(mouseY, 0, height-1, 1, 179);
    
    
    float derivedX = 100 * cos(phi) * sin(theta);
    println("X: " + derivedX);
    float derivedY = 100 * cos(theta);
    println("Y: " + derivedY);
    float derivedZ = 100 * sin(phi) * sin(theta);
    println("Z: " + derivedZ);
    
    float positionX  = currentTarget.x + derivedX;
    float positionY = currentTarget.y + derivedY;
    float positionZ = currentTarget.z + derivedZ;
    
 //   translate(400,400,50);
    
    camera(positionX, positionY, positionZ, currentTarget.x, currentTarget.y, currentTarget.z, 0.0, 1.0, 0.0);
    
  }
  
  void AddLookAtTarget(PVector newPosition){
    
    myTargets.add(newPosition);
    
  }
  
  void CycleTarget(){
    
    currentTargetIndex++;
    
    if(currentTargetIndex == (myTargets.size())){
    
      currentTargetIndex = 0;
      return;
      
    }
    
    
    
    
  }
  
  void Zoom(float zoomAmount){
    
  }
  
  
  
}
