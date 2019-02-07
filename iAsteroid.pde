class iAsteroid extends iFloater{
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
  private float dRadians = (float)(myPointDirection*(Math.PI/180));
  private float rotateAsteroid;
  private int range;
  private float angle;
  private float asteroidX, asteroidY;
  private float myRad, myVert, myColor, myDivets;
  private int []offset;
  
  public iAsteroid(){
    //myCenterX = ship.getX();
    //myCenterY = ship.getY();
    //myPointDirection = ship.getPointDirection();
    //double dRadians = myPointDirection * (Math.PI/180);
    range = 11000;
    myDirectionX = 10 * Math.cos(dRadians) + fighter.getDirectionX();
    myDirectionY = 10 * Math.sin(dRadians) + fighter.getDirectionY();
    myCenterX = (int)(Math.random()*range);
    myCenterY = (int)(Math.random()*range);
    rotateAsteroid = (int)((Math.random()*6)-3);
    myRad = (int)(Math.random()*20)+20;
    myVert = (int)(Math.random()*7)+9;
    myColor = (int)(Math.random()*20)+30;
    offset = new int[300];
    for(int i = 0; i < asteroids.size(); i++){
      offset[i] = ((int)(Math.random()*10)-5);
    }
  }
  
  public void show(){
    //fill(255);
    //rect((int)myCenterX - (int)fighter.myCenterX - 5000, (int)myCenterY -(int)fighter.myCenterY - 5000, 20, 10);
    
  }
  
  public void showAndMove(){
    pushMatrix();
    translate((int)myCenterX - (int)fighter.myCenterX - 5000, (int)myCenterY - (int)fighter.myCenterY - 5000);
    rotate(rotateAsteroid);
    fill(myColor, 30, 30);
    //fill(255);
    beginShape();
    for(int i = 0; i < myVert; i++){
      angle = map(i, 0, myVert, 0, TWO_PI);
      asteroidX = (myRad + offset[i])*cos(angle);
      asteroidY = (myRad + offset[i])*sin(angle);
      vertex(asteroidX, asteroidY);
    }
    endShape();
    //super.move();
    myCenterX += Math.cos(rotateAsteroid);
    myCenterY += Math.sin(rotateAsteroid);
    popMatrix();
    rotateAsteroid = rotateAsteroid + 0.01;

  }
}
