class iBullet extends iFloater{
  public void setX(int x){myCenterX = x;}
  public int getX() {return((int)myCenterX);}
  public void setY(int y) {myCenterY = y;}
  public int getY() {return((int)myCenterY);}
  public void setDirectionX(double x) {myDirectionX = x;}   
  public double getDirectionX() {return(myDirectionX);}
  public void setDirectionY(double y) {myDirectionY = y;}   
  public double getDirectionY() {return(myDirectionY);}   
  public void setPointDirection(int degrees) {myPointDirection = degrees;}   
  public double getPointDirection() {return(myPointDirection);}
  private double dRadians;
  private int bCX, bCY;
  
  //private double dRadians = myPointDirection*(Math.PI/180);
  public iBullet(iSpaceship shoot){
    myCenterX = fighter.getX();
    myCenterY = fighter.getY();
    //zeroX = 
    //zeroY = 
    dRadians = shoot.myPointDirection*(Math.PI/180);
    myPointDirection = fighter.getPointDirection();
    myDirectionX = 10 * Math.cos(dRadians) + fighter.getDirectionX();
    myDirectionY = 10 * Math.sin(dRadians) + fighter.getDirectionY();
    bCX = 900 - (int)fighter.myCenterX;
    bCY = 725 - (int)fighter.myCenterY;
    //distFromBase = dist
  }
  
  public void show(){
    /*
    translate((float)myCenterX, (float)myCenterY);//(900 - (int)fighter.myCenterX, 725 - (int)fighter.myCenterY);
    //rotate(dRadians);
    fill(255, 0, 0, 150);
    noStroke();
    fill(255,0, 0, 175);
    rect(40, 0, 25, 3, 50);
    // Unrotate
    //rotate(-1*dRadians);
    //    println(myCenterX + ", " +myCenterY);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
    */
    //pushMatrix();
    
               /* Original Bullet // 
    translate(bCX, bCY);
    rotate((float)dRadians);
    fill(255, 0, 0, 150);
    noStroke();
    fill(255,0, 0, 175);
    rect(bCX - (int)fighter.myCenterX - 50, bCY - (int)fighter.myCenterY + 75, 25, 3, 50);// --- > HOLY COW(int)fighter.myCenterX,0, 25, 3, 50 - bCX);//bCX - (int)fighter.myCenterX,0, 25, 3, 50);
    //println(bCX - (int)fighter.myCenterX - 500);
    rotate(-1*(float)dRadians);
    translate(-1*(bCX), -1*(bCY));
    //popMatrix();
                 */
                 
    //rotate((float)dRadians);
    noStroke();
    fill(255,50, 50, 240);
    ellipse(-1*(400 - (float)fighter.myCenterX) + bCX, -1*(400-(float)fighter.myCenterY) + bCY, 5,5);//(bCX, bCY, 5 ,5); // 400,400
    //rotate(-1*(float)dRadians);
  
}
  
  public void move(){
    bCX = (int)myDirectionX + bCX;
    bCY = (int)myDirectionY + bCY;
    //myCenterX += myDirectionX;  
    //myCenterY += myDirectionY;
    //myDirectionX = myCenterX + myDirectionX;
    //myDirectionY = myCenterY + myDirectionY;
    //    println(myDirectionX + ", " + myDirectionY);
  }
}
