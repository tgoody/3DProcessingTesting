

class Camera{
  
  ArrayList<PVector> myTargets = new ArrayList<PVector>();
  PVector currentTarget;
  int currentTargetIndex;
  int radius;
  
  void setUpCamera(){
    perspective(radians(50.0f), float(width)/float(height), 0.1, 1000);
    radius = 100;
    
  }
  
  void Update(){
    
    currentTarget = myTargets.get(currentTargetIndex);
    
    float phi = map(mouseX, 0, width-1, 0, 360);
    float theta = map(mouseY, 0, height-1, 1, 179);
    
    
    float derivedX = radius * cos(radians(phi)) * sin(radians(theta));
    float derivedY = radius * cos(radians(theta));
    float derivedZ = radius * sin(radians(phi)) * sin(radians(theta));
    
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
    
    radius+=zoomAmount;
    if(radius > 200){
     radius = 200; 
    }
    
    if(radius < 30){
      radius = 30;
    }
    
  }
  
  
  
}
