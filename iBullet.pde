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
  protected float closestDistance;
  private int closest;
  
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
    //fill(get(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY));//get(abs((int)bCX - 500), abs((int)bCY - 325)));
    ellipse(-1*(400 - (float)fighter.myCenterX) + bCX, -1*(400 - (float)fighter.myCenterY) + bCY, 5,5);
    fill(255);
    //ellipse(abs((int)bCX - 500), abs((int)bCY - 325),10,10); < Very cool bounce off top left of screen
  
}
  public void collision(){
    //for(int i = 0; i < projectile.size(); i++){
      //println(get(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY));
      //closestDistance = dist(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY, asteroids.get(0).getX(), asteroids.get(0).getY());
closestDistance = dist((int)asteroids.get(0).getX() - (int)fighter.myCenterX - 5000, (int)asteroids.get(0).getY() - (int)fighter.myCenterY - 5000, -1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY);
println(closestDistance);
//closestDistance = dist(-1*(bCX - 500), -1*(bCY - 325), asteroids.get(0).getX(), asteroids.get(0).getY());
      while(get(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY) > -16000000 && get(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY) < -13487566){
        //println(true);
        for(int i = 1; i < asteroids.size(); i++){
          if(dist(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY, asteroids.get(i).getX(), asteroids.get(i).getY()) < closestDistance){
            closestDistance = dist(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY, asteroids.get(i).getX(), asteroids.get(i).getY());
            
            closest = i;
          }
 
        }
        break;
      }
        //println(closestDistance);
        //asteroids.remove(closest);
              //closestDistance = dist(-1*(400 - (int)fighter.myCenterX) + bCX, -1*(400 - (int)fighter.myCenterY) + bCY, asteroids.get(0).getX(), asteroids.get(0).getY());
        //println(true);
      
    //}
  }
  public void distance(int i){
    //println(dist(abs((float)bCX - 500), abs((float)bCY - 325), (int)abs(fighter.getX() - 400), (int)abs(fighter.getY() - 400)));
    if(dist(abs((float)bCX - 500), abs((float)bCY - 325), (int)abs(fighter.getX() - 400), (int)abs(fighter.getY() - 400)) > 50){
      projectile.remove(i);
    }
  }
  public void move(){
    bCX = (int)(myDirectionX) + bCX;
    bCY = (int)(myDirectionY) + bCY;
  }
}
