class iBoundary extends iBase{
  public iBoundary(){
  }
  public void show(){
    bCX = baseCenterX - (int)fighter.myCenterX;
    bCY = baseCenterY - (int)fighter.myCenterY;
    rectMode(CENTER);
    noFill();
    stroke(255, 0, 0, 100);
    strokeWeight(1000);
    rect(bCX, bCY, 9100, 9100);
    //LEFT BORDER
    if(bCX - fighter.myCenterX > bCX + 4000){
      fighter.myCenterX = bCX - 4300;
    }
    //RIGHT BORDER
    if(bCX - fighter.myCenterX < bCX - 5000){
      fighter.myCenterX = bCX + 4300;
    }
    //TOP BORDER
    if(bCY - fighter.myCenterY > bCY + 4000){
      fighter.myCenterY = bCY - 4300;
    }
    //BOTTOM BORDER
    if(bCY - fighter.myCenterY < bCY - 5000){
      fighter.myCenterY = bCY + 4300;
    }
    
  }
}
