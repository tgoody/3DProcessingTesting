

class Camera{
  
  ArrayList<PVector> myTargets = new ArrayList<PVector>();
  PVector currentTarget;
  int currentTargetIndex;
  
  void setUpCamera(){
    perspective(radians(50.0f), float(width)/float(height), 0.1, 1000);
    
  }
  
  void Update(){
    
    currentTarget = myTargets.get(currentTargetIndex);
    
    float derivedX = map(mouseX, 0, width-1, 0, 360);
    float derivedY = map(mouseY, 0, height-1, 1, 179);
    
    
    float positionX  = currentTarget.x + derivedX;
    float positionY = currentTarget.y + derivedY;
    
 //   translate(400,400,50);
    
    camera(positionX, positionY, 100, currentTarget.x, currentTarget.y, currentTarget.z, 0.0, 1.0, 0.0);
    
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
