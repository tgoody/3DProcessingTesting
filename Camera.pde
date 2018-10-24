

class Camera{
  
  ArrayList<PVector> myTargets;
  PVector currentTarget = new PVector(0, 0, 0);
  
  void setUpCamera(){
    perspective(radians(50.0f), float(width)/float(height), 0.1, 1000);
    
  }
  
  void Update(){
    
    float derivedX = map(mouseX, 0, width-1, 0, 360);
    float derivedY = map(mouseY, 0, height-1, 1, 179);
    
    
    float positionX  = currentTarget.x + derivedX;
    float positionY = currentTarget.y + derivedY;
    
    
    //camera(positionX, positionY, 100, currentTarget.x, currentTarget.y, currentTarget.z, 0.0, 0.0, 0.0);
    
  }
  
  void AddLookAtTarget(PVector newPosition){
    
    
    
  }
  
  void CycleTarget(){
  }
  
  void Zoom(float zoomAmount){
    
  }
  
  
  
}
