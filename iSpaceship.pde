class iSpaceship extends iFloater//extends Floater  
{
  public iSpaceship(){
    /*corners = 40;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = 1;
    yCorners[0] = 12;
    xCorners[1] = ;
    yCorners[1] = ;
    xCorners[2] = ;
    yCorners[2] = ;
    */
    myCenterX = myCenterY = 400;
      myDirectionX = myDirectionY = 0;
      myPointDirection = 0;
     
  }
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
  
  public void show(){
    stroke(0);
    //translate(500,325);
    // Translates to center of ship
    translate((float)myCenterX, (float)myCenterY);
    // Sets the rotation point to center of ship
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    //noStroke();
    rotate(dRadians);
    rectMode(CENTER);
    if(accelerating == true){
      noStroke();
      fill(255, 93, 0, 130);
      ellipse(-35, 0, 20, 12);
      fill(255, 93, 0, 80);
      ellipse(-32, 0, 12, 6);
    }
    stroke(0);
    fill(77, 68, 68);
    rect(0, 0, 30, 18);
    rect(10, 0, 30, 12);
    rect(10, 0, 45, 6);
    rect(-15, 0, 5, 70);
    rect(-11, -31, 6, 5);
    rect(-11, -35, 20, 5); //left wing
    //rect(-11, -31, 6, 5);
    rect(-11, 31, 6, 5);
    rect(-11, 35, 20, 5); //right wing
    rect(-11, 0, 5, 40);
    rect(-7, 0, 10, 25);
    rect(-25, 0, 8, 30);
    rect(-20, 0, 14, 15);
    fill(0);
    rect(5, 0, 20, 4);
    fill(0, 0, 255, 100);
    rect(5, 0, 20, 6);
    fill(57, 48, 48);
    
    if(decelerating == true){
      noStroke();
      fill(255, 0, 0);
      ellipse(-20, -34, 3, 3);
      fill(255, 0, 0, 80);
      ellipse(-22, -34, 10, 10);
      
      fill(255, 0, 0);
      ellipse(-20, 34, 3, 3);
      fill(255, 0, 0, 80);
      ellipse(-22, 34, 10, 10);
    }
  }
  
  public void constantVel(double dAmount)   
  {          
    double dRadians =myPointDirection*(Math.PI/180);     
    myDirectionX = ((dAmount) * Math.cos(dRadians));    
    myDirectionY = ((dAmount) * Math.sin(dRadians));       
  } 
  //Overrided floater acceleration function
  public void acceleratee (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians = myPointDirection*(Math.PI/180);   
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));    
  }  
  public void deceleratee ()   
  {          
    deceleratingDown = true;
    //convert the current direction the floater is pointing to radians    
    //double dRadians =myPointDirection*(Math.PI/180);   
    //change coordinates of direction of travel   
    //line(0,0, (float)fighter.myCenterX -300, (float)fighter.myCenterY - 300);
    myDirectionX *= 0.97; 
    myDirectionY *= 0.97;  
    deceleratingDown = false;
  }   
}
