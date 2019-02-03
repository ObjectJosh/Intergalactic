class iBase{
  protected int baseCenterX, baseCenterY;//, bCX, bCY;
  public iBase(){
    baseCenterX = 900;
    baseCenterY = 725;
    part1Rad = 1;
    part1Shade = 0;
    part2Rad = 1;
    part2Shade = 0;
  }
  protected int bCX;
  protected int bCY;
  private float spinSpokes;
  private float part1Rad, part1Shade, part2Rad, part2Shade;
  private boolean mine1, mine2, activateMine1Sign, activateMine2Sign;
  private int signColor, signColorChange;
  private float arrow1Bobbing;
  private float arrow1BobbingShift = 0.8;
  private float arrow2Bobbing;
  private float arrow2BobbingShift = 0.8;
  //MINE UPGRADES
  private int mine1Lvl = 1, mine2Lvl = 1;
  private float part1RadChange = 0.15;
  private float part1ShadeChange = 1.5;
  private int novaPerParticle1 = 1;
  private int mine1UpgradeCost = 500;
  private float part2RadChange = 0.15;
  private float part2ShadeChange = 1.5;
  private int novaPerParticle2 = 1;
  private int mine2UpgradeCost = 500;
  private boolean upgrade1Closer, upgrade2Closer;
  private float close1Gate, close2Gate;
  private float close1GateShift = 1;
  private float close2GateShift = 1;
  private int countClosed, countClosed2;
  private boolean inShip = false;

  //private String leftBox;
  //private int uSpeed;
  //float rot;
  public void show(){
    bCX = baseCenterX - (int)fighter.myCenterX;
    bCY = baseCenterY - (int)fighter.myCenterY;
    translate(0,0);
    //pushMatrix();
    //rotate(rot);
    //rot = rot + 0.001;
    //fill(0,255,0,200);
    noFill();
    //MINE 1
    // LEVEL (TWO) MINE UPGRADE TO (THREE) $1500 NOVA
    if(clicked == true && nova >= 1500 && mine1Lvl == 2 && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450){
      nova = nova - 1500;
      part1RadChange = 0.7;
      part1ShadeChange = 7;
      novaPerParticle1 = 10;
      mine1UpgradeCost = 2500;
      mine1Lvl = 3;
      upgrade1Closer = true;
    }
    // LEVEL (ONE) MINE UPGRADE TO (TWO) $500 NOVA
    if(clicked == true && mine1 == true && nova >= 500 && mine1Lvl == 1 && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450){
      nova = nova - 500;
      part1RadChange = 0.3;
      part1ShadeChange = 3;
      novaPerParticle1 = 5;
      mine1UpgradeCost = 1500;
      mine1Lvl = 2;
      upgrade1Closer = true;
    }
    //MINE 2
    // LEVEL (TWO) MINE UPGRADE TO (THREE) $1500 NOVA
    if(clicked == true && nova >= 500 && mine2Lvl == 2 && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450){
      nova = nova - 1500;
      part2RadChange = 0.7;
      part2ShadeChange = 7;
      novaPerParticle2 = 10;
      mine2UpgradeCost = 2500;
      mine2Lvl = 3;
      upgrade2Closer = true;
    }
    // LEVEL (ONE) MINE UPGRADE TO (TWO) $500 NOVA
    if(clicked == true && mine2 == true && nova >= 500 && mine2Lvl == 1 && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450){
      nova = nova - 500;
      part2RadChange = 0.3;
      part2ShadeChange = 3;
      novaPerParticle2 = 5;
      mine2UpgradeCost = 1500;
      mine2Lvl = 2;
      upgrade2Closer = true;
    }
    // CHECK IF ACTIVATE MINE SIGNS ARE ON
    if(clicked == true && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450){
      mine1 = true;
    }else{
      activateMine1Sign = true;
    }
    if(clicked == true && mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450){
      mine2 = true;
    }else{
      activateMine2Sign = true;
    }
    if(bCY < 825 && bCY > -175 && bCX < 750 && bCX > 250){// Original 0 < bCY < 600
      shipInterior();
      shipItems();
      shipMines();
      shipUpgrades();
      upgradeClosers();
      shipSigns();
      inShip = true;
    }else{
      inShip = false;
      textSize(30);
      shipMines();
      shipExterior();
    }
    arrowHome();
    //println((baseCenterX - (int)fighter.myCenterX) + ", " + (baseCenterY -(int)fighter.myCenterY));
    fill(255, 255, 255);
    //Reset strokeWeight and stroke
    strokeWeight(1);
    stroke(0);
  }
  
  public void upgradeClosers(){
    if(upgrade1Closer == true){
      close1Gate = close1Gate + close1GateShift;
      if(close1Gate > 79){
        close1GateShift = 0;
        countClosed++;
      }
      if(countClosed > 50){
        close1GateShift = -1;
        if(close1Gate < 2){
          close1GateShift = 1;
          close1Gate = 0;
          countClosed = 0;
          upgrade1Closer = false;
        }
      }
      pushMatrix();
      rectMode(CORNER);
      //noStroke();
      stroke(0,255,0,150);
      fill(0);
      rect(bCX - 80, bCY - 445, close1Gate, 160);
      fill(0);
      rect(bCX + 80, bCY - 445, -close1Gate, 160);
      popMatrix();
      rectMode(CENTER);
    }
    if(upgrade2Closer == true){
      close2Gate = close2Gate + close2GateShift;
      if(close2Gate > 79){
        close2GateShift = 0;
        countClosed2++;
      }
      if(countClosed2 > 50){
        close2GateShift = -1;
        if(close2Gate < 2){
          close2GateShift = 1;
          close2Gate = 0;
          countClosed2 = 0;
          upgrade2Closer = false;
        }
      }
      if(close2Gate < 0){
        close2GateShift = 1;
      }
      pushMatrix();
      rectMode(CORNER);
      //noStroke();
      stroke(0,255,0,150);
      fill(0);
      rect(bCX - 80, bCY + 445, close2Gate, -160);
      fill(0);
      rect(bCX + 80, bCY + 445, -close2Gate, -160);
      popMatrix();
      rectMode(CENTER);
    }
  }
  
  public void shipMines(){
    //TOP MINE
    if(mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450 && mine1 == true){
      // Feet
      noStroke();
      fill(100);
      ellipse(bCX - 60, bCY - 425, 30, 30);
      ellipse(bCX + 60, bCY - 425, 30, 30);
      ellipse(bCX - 60, bCY - 305, 30, 30);
      ellipse(bCX + 60, bCY - 305, 30, 30);
      fill(125);
      ellipse(bCX - 60, bCY - 425, 15, 15);
      ellipse(bCX + 60, bCY - 425, 15, 15);
      ellipse(bCX - 60, bCY - 305, 15, 15);
      ellipse(bCX + 60, bCY - 305, 15, 15);
      // Legs
      stroke(150);
      if(inShip == true){
      line(bCX - 60, bCY - 305, bCX - 20, bCY - 355);
      line(bCX + 60, bCY - 305, bCX + 20, bCY - 355);
      line(bCX - 60, bCY - 425, bCX - 20, bCY - 375);
      line(bCX + 60, bCY - 425, bCX + 20, bCY - 375);
      }
      // Container
      noStroke();
      fill(100);
      fill(125);
      ellipse(bCX, bCY - 365, 100, 100);
      fill(50);
      ellipse(bCX, bCY - 365, 80, 80);
      // Spokes
      fill(150);
      pushMatrix();
      translate(bCX, bCY - 365);
      rotate(spinSpokes);
      rect(0, -35,3,10);
      rotate(0.5);
      rect(35,0,10,3);
      rotate(-1);
      rect(-35,0,10,3);
      popMatrix();
      fill(50);
      ellipse(bCX, bCY - 365, 60, 60);
      pushMatrix();
      translate(bCX, bCY - 365);
      rotate(spinSpokes);
      // Particle beam
      fill(74, 189, 232, part1Shade - 30);
      rect(0, -15,1,30);
      rotate(0.5);
      rect(15,0,30,1);
      rotate(-1);
      rect(-15,0,30,1);
      // "unrotate"
      rotate(0.5);
      
      // Dots on end of spokes
      fill(40);
      ellipse(0, -27,8,8);
      rotate(0.5);
      ellipse(27,0,8,8);
      rotate(-1);
      ellipse(-27,0,8,8);
      popMatrix();
      spinSpokes = spinSpokes + 0.01;
      
      // Particle
      fill(74, 189, 232, part1Shade);
      ellipse(bCX, bCY - 365, part1Rad, part1Rad);
    }
    //partRad = partRad + 0.15;
    //BOTTOM MINE
    if(mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450 && mine2 == true){
      // Feet
      noStroke();
      fill(100);
      ellipse(bCX - 60, bCY + 425, 30, 30);
      ellipse(bCX + 60, bCY + 425, 30, 30);
      ellipse(bCX - 60, bCY + 305, 30, 30);
      ellipse(bCX + 60, bCY + 305, 30, 30);
      fill(125);
      ellipse(bCX - 60, bCY + 425, 15, 15);
      ellipse(bCX + 60, bCY + 425, 15, 15);
      ellipse(bCX - 60, bCY + 305, 15, 15);
      ellipse(bCX + 60, bCY + 305, 15, 15);
      // Legs
      stroke(150);
      line(bCX - 60, bCY + 305, bCX - 20, bCY + 355);
      line(bCX + 60, bCY + 305, bCX + 20, bCY + 355);
      line(bCX - 60, bCY + 425, bCX - 20, bCY + 375);
      line(bCX + 60, bCY + 425, bCX + 20, bCY + 375);
      // Container
      noStroke();
      fill(100);
      fill(125);
      ellipse(bCX, bCY + 365, 100, 100);
      fill(50);
      ellipse(bCX, bCY + 365, 80, 80);
      // Spokes
      fill(150);
      pushMatrix();
      translate(bCX, bCY + 365);
      rotate(spinSpokes);
      rect(0, -35,3,10);
      rotate(0.5);
      rect(35,0,10,3);
      rotate(-1);
      rect(-35,0,10,3);
      popMatrix();
      fill(50);
      ellipse(bCX, bCY + 365, 60, 60);
      pushMatrix();
      translate(bCX, bCY + 365);
      rotate(spinSpokes);
      // Particle beam
      fill(74, 189, 232, part2Shade - 30);
      rect(0, -15,1,30);
      rotate(0.5);
      rect(15,0,30,1);
      rotate(-1);
      rect(-15,0,30,1);
      // "unrotate"
      rotate(0.5);
      
      // Dots on end of spokes
      fill(40);
      ellipse(0, -27,8,8);
      rotate(0.5);
      ellipse(27,0,8,8);
      rotate(-1);
      ellipse(-27,0,8,8);
      popMatrix();
      spinSpokes = spinSpokes + 0.01;
      
      // Particle
      fill(74, 189, 232, part2Shade);
      ellipse(bCX, bCY + 365, part2Rad, part2Rad);
    }
    // Particle 1
    if(mine1 == true){
      part1Rad = part1Rad + part1RadChange; // part1Rad = part1Rad + 0.15;
      part1Shade = part1Shade + part1ShadeChange; // part1Shade = part1Shade + 1.5;
      if(part1Rad > 35){
        part1Rad = 1;
        part1Shade = 0;
        nova = nova + novaPerParticle1; // nova = nova + 1;
      }
    }
    // Particle 2
    if(mine2 == true){
      part2Rad = part2Rad + part2RadChange; // part2Rad = part2Rad + 0.15;
      part2Shade = part2Shade + part2ShadeChange; // part2Shade = part2Shade + 1.5;
      if(part2Rad > 35){
        part2Rad = 1;
        part2Shade = 0;
        nova = nova + novaPerParticle2; // nova = nova + 1;
      }
    }
  }
  
  public void shipSigns(){
    if(activateMine1Sign == true && mine1 == false){
      fill(signColor);
      textSize(30);
      text("Click to\nActivate", bCX, bCY - 370);
      noStroke();
      rect(bCX, bCY - 201 + arrow1Bobbing, 10, 40);
      triangle(bCX, bCY - 235 + arrow1Bobbing, bCX + 15, bCY - 220 + arrow1Bobbing, bCX - 15, bCY - 220 + arrow1Bobbing);
      arrow1Bobbing = arrow1Bobbing + arrow1BobbingShift;
      if(arrow1Bobbing < 0){
        arrow1BobbingShift = 0.8;
      }
      if(arrow1Bobbing > 15){
        arrow1BobbingShift = -0.8;
      }
    }
    if(activateMine2Sign == true && mine2 == false){
      fill(signColor);
      textSize(30);
      text("Click to\nActivate", bCX, bCY + 360);
      noStroke();
      rect(bCX, bCY + 201 - arrow2Bobbing, 10, 40);
      triangle(bCX, bCY + 235 - arrow2Bobbing, bCX + 15, bCY + 220 - arrow2Bobbing, bCX - 15, bCY + 220 - arrow2Bobbing);
      arrow2Bobbing = arrow2Bobbing + arrow2BobbingShift;
      if(arrow2Bobbing < 0){
        arrow2BobbingShift = 0.8;
      }
      if(arrow2Bobbing > 15){
        arrow2BobbingShift = -0.8;
      }
    }
    signColor = signColor + signColorChange;
    if(signColor > 235){
      signColorChange = -3;
    }
    if(signColor < 5){
      signColorChange = 2;
    }
    if(mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY < bCY - 280 && mouseY > bCY - 450 && mine1 == true){
      pushMatrix();
      translate(mouseX, mouseY);
      rectMode(CORNER);
      fill(0);
      strokeWeight(4);
      stroke(0,255,0,150);
      rect(15,-125, 180, 100);
      line(0, 0, 15, -25);
      noStroke();
      fill(0,255,0,150);
      //fill(5, 147, 24);
      //fill(0);
      ellipse(0,0,8,8);
      textAlign(CENTER);
      textSize(15);
      text("Nova Mine" + " Lvl. " + mine1Lvl, 105, -102.5);
      textSize(9);
      textLeading(14);
      //textAlign(LEFT);
      text("A gift from the National Aeronautics\nand Space Administration of Earth,\nNova Mines were the most advanced\nnuclear fusion machines of the time.", 105, -82.5);
      // Upgrade cost sign
      fill(0);
      stroke(0,255,0,150);
      rect(40, 15, 155, 35);
      line(0,0, 40, 15);
      fill(0,255,0,150);
      textSize(11);
      text("Upgrade Cost: " + mine1UpgradeCost +" Nova", 117.5, 30);
       text("Click to Upgrade", 117.5, 42.5);
      popMatrix();
      textSize(30);
    }
    if(mouseX > bCX - 80 && mouseX < bCX + 80 && mouseY > bCY + 280 && mouseY < bCY + 450 && mine2 == true){
      pushMatrix();
      translate(mouseX, mouseY);
      rectMode(CORNER);
      fill(0);
      strokeWeight(4);
      stroke(0,255,0,150);
      rect(15,-125, 180, 100);
      line(0, 0, 15, -25);
      noStroke();
      fill(0,255,0,150);
      //fill(5, 147, 24);
      //fill(0);
      ellipse(0,0,8,8);
      textAlign(CENTER);
      textSize(15);
      text("Nova Mine" + " Lvl. " + mine2Lvl, 105, -102.5);
      textSize(9);
      textLeading(14);
      //textAlign(LEFT);
      text("A gift from the National Aeronautics\nand Space Administration of Earth,\nNova Mines were the most advanced\nnuclear fusion machines of the time.", 105, -82.5);
      // Upgrade cost sign
      fill(0);
      stroke(0,255,0,150);
      rect(40, 15, 155, 35);
      line(0,0, 40, 15);
      fill(0,255,0,150);
      textSize(11);
      text("Upgrade Cost: " + mine2UpgradeCost +" Nova", 117.5, 30);
       text("Click to Upgrade", 117.5, 42.5);
      popMatrix();
      textSize(30);
    }
  }
  public void shipItems(){
    // Left Boxes
    rect(bCX - 200, bCY - 175, 50, 100);
    rect(bCX - 200, bCY, 50, 100);
    rect(bCX - 200, bCY + 175, 50, 100);
    // Right Boxes
    rect(bCX + 200, bCY - 175, 50, 100);
    rect(bCX + 200, bCY, 50, 100);
    rect(bCX + 200, bCY + 175, 50, 100);
    // Mines (Top / Bottom)
    rect(bCX, bCY - 365, 160, 160);
    rect(bCX, bCY + 365, 160, 160);
  }
  
  public void shipUpgrades(){
    textAlign(CENTER, CENTER);
    textSize(30);
    fill(180);
    // Left Boxes
    //leftBox = "mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225";
    //Speed, Turn, Rate(of fire), Health, Hyperspace, Gun?
    if(mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225){
      text(uSpeed , bCX - 200, bCY - 175);
    }
    if(mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY + 50 && mouseY > bCY - 50){
      text("0" , bCX - 200, bCY);
    }
    if(mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY > bCY + 125 && mouseY < bCY + 225){
      text("0" , bCX - 200, bCY + 175);
    }
    // Right Boxes
    if(mouseX > bCX + 175 && mouseX < bCX + 225 && mouseY < bCY - 125 && mouseY > bCY - 225){
      text("0" , bCX + 200, bCY - 175);
    }
    if(mouseX > bCX + 175 && mouseX < bCX + 225 && mouseY < bCY + 50 && mouseY > bCY - 50){
      text("0" , bCX + 200, bCY);
    }
    if(mouseX > bCX + 175 && mouseX < bCX + 225 && mouseY > bCY + 125 && mouseY < bCY + 225){
      text("0" , bCX + 200, bCY + 175);
    }
    if(clicked == true && mouseX < bCX - 175 && mouseX > bCX - 225 && mouseY < bCY - 125 && mouseY > bCY - 225){
      uSpeed++;
      clicked = false;
    }else{
      clicked = false;
    }
  }
  
  public void shipInterior(){
    stroke(0,255,0,150);
      strokeWeight(5);
      fill(0);
      ellipse(bCX, bCY - 250, 500, 500);
      ellipse(bCX, bCY + 250, 500, 500);
      rect(bCX, bCY, 500, 500);
      ellipse(bCX, bCY, 100, 100);
  }
  
  public void shipExterior(){
      strokeWeight(5);
      stroke(40); // color of outside border of panels
      line(bCX - 628, bCY - 248, bCX - 628, bCY + 248);
      line(bCX + 627, bCY - 248, bCX + 627, bCY + 248);
      line(bCX - 628, bCY + 251, bCX - 379, bCY + 281);
      line(bCX + 627, bCY + 251, bCX + 378, bCY + 281);
      noStroke();
      fill(75); // color of metal bar
      rect(bCX, bCY, 800, 20);
      fill(100); // color of ship
      rect(bCX, bCY, 500, 500);
      ellipse(bCX, bCY - 250, 500, 500);
      ellipse(bCX, bCY + 250, 500, 500);
      fill(50);
      ellipse(bCX - 248, bCY, 20, 22);
      fill(75);
      ellipse(bCX - 250, bCY, 20, 20);
      fill(50);
      ellipse(bCX + 248, bCY, 20, 22);
      fill(75);
      ellipse(bCX + 250, bCY, 20, 20);
      fill(100, 100);
      //rect(bCX + 500, bCY, 250, 500);
      //rect(bCX - 500, bCY, 250, 500);
      beginShape();
      fill(50);
      vertex(bCX + 625, bCY - 250);
      vertex(bCX + 625, bCY + 250);
      vertex(bCX + 375, bCY + 280);
      vertex(bCX + 375, bCY - 220);
      endShape(CLOSE);
      beginShape();
      fill(50);
      vertex(bCX - 625, bCY - 250);
      vertex(bCX - 625, bCY + 250);
      vertex(bCX - 375, bCY + 280);
      vertex(bCX - 375, bCY - 220);
      endShape(CLOSE);
      // Panel Grid
      strokeWeight(2);
      stroke(100, 100); // set grid color
      // VERTICAL
      line(bCX - 600, bCY - 246, bCX - 600, bCY + 251);
      line(bCX - 550, bCY - 240, bCX - 550, bCY + 257);
      line(bCX - 500, bCY - 234, bCX - 500, bCY + 263);
      line(bCX - 450, bCY - 228, bCX - 450, bCY + 269);
      line(bCX - 400, bCY - 222, bCX - 400, bCY + 275);
      // Other side
      line(bCX + 600, bCY - 246, bCX + 600, bCY + 251);
      line(bCX + 550, bCY - 240, bCX + 550, bCY + 257);
      line(bCX + 500, bCY - 234, bCX + 500, bCY + 263);
      line(bCX + 450, bCY - 228, bCX + 450, bCY + 269);
      line(bCX + 400, bCY - 222, bCX + 400, bCY + 275);
      // HORIZONTAL
      line(bCX - 623.5, bCY - 221, bCX - 376, bCY - 195 + 4);
      line(bCX - 623.5, bCY - 146.5, bCX - 376, bCY - 120.5 + 4);
      line(bCX - 623.5, bCY - 72, bCX - 376, bCY - 46 + 5);
      line(bCX - 623.5, bCY + 2.5, bCX - 376, bCY + 28.5 + 4);
      line(bCX - 623.5, bCY + 77, bCX - 376, bCY + 103 + 4);
      line(bCX - 623.5, bCY + 151.5, bCX - 376, bCY +177.5 + 4);
      line(bCX - 623.5, bCY + 226, bCX - 376, bCY + 252 + 4);
      // Other side
      line(bCX + 623.5, bCY - 221, bCX + 376, bCY - 195 + 4);
      line(bCX + 623.5, bCY - 146.5, bCX + 376, bCY - 120.5 + 4);
      line(bCX + 623.5, bCY - 72, bCX + 376, bCY - 46 + 5);
      line(bCX + 623.5, bCY + 2.5, bCX + 376, bCY + 28.5 + 4);
      line(bCX + 623.5, bCY + 77, bCX + 376, bCY + 103 + 4);
      line(bCX + 623.5, bCY + 151.5, bCX + 376, bCY +177.5 + 4);
      line(bCX + 623.5, bCY + 226, bCX + 376, bCY + 252 + 4);
    }
    
    public void arrowHome(){
      float distFromiBaseX = (baseCenterX - (float)fighter.myCenterX)-(width/2);
      float distFromiBaseY = (baseCenterY - (float)fighter.myCenterY)-(height/2);
      //float di = dist(width/2, height/2, distFromiBaseX + width/2, distFromiBaseY + height/2);
      //println(di);
      if(distFromiBaseX > 1000 || distFromiBaseX < -1000 || distFromiBaseY > 1000 || distFromiBaseY < -1000){
        away = true;
        pushMatrix();
      //float dRadians = (float)(myPointDirection*(Math.PI/180));
      //translate(baseCenterX- (float)fighter.myCenterX, baseCenterY-(float)fighter.myCenterY);
      //translate(0,0);
      strokeWeight(1);
      stroke(100, 200);
      //line(0,0, (float)fighter.myCenterX - bCX + 100, (float)fighter.myCenterY - bCY - 75);
      line(width/2,height/2, baseCenterX - (float)fighter.myCenterX, baseCenterY-(float)fighter.myCenterY);
      //line(
      popMatrix();
      }else{
        away = false;
      }
    }
}
