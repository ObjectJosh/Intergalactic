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
  
  public iBullet(iSpaceship shoot){
    dRadians = shoot.myPointDirection*(Math.PI/180);
    myPointDirection = fighter.getPointDirection();
    myDirectionX = 10 * Math.cos(dRadians) + fighter.getDirectionX();
    myDirectionY = 10 * Math.sin(dRadians) + fighter.getDirectionY();
    bCX = 900 - (int)fighter.myCenterX;
    bCY = 725 - (int)fighter.myCenterY;
  }
  
  public void show(){
    noStroke();
    fill(255,50, 50, 240);
    ellipse(-1*(400 - (float)fighter.myCenterX) + bCX, -1*(400 - (float)fighter.myCenterY) + bCY, 5,5);
  
}
  public void distance(int i){
    if(dist(abs((float)bCX - 500), abs((float)bCY - 325), (int)abs(fighter.getX() - 400), (int)abs(fighter.getY() - 400)) > 500){
      projectile.remove(i);
    }
  }
  public void move(){
    bCX = (int)(myDirectionX) + bCX;
    bCY = (int)(myDirectionY) + bCY;
  }
}
