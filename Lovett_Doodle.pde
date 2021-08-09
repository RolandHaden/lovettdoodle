 /*
Lovett Space Doodle
 Author: Davis Haden
 Date Created: 5-5-2020
 Date Last Modified:5-19-2020
 Desc: This program is a space game to signify the connections between Lovett and Space. 
 As more things happen, the more events can be added to the game. 
 The game will also show special space events not related to Lovett. 
 Requires Sound Library!
 Processing does not like it when you use the first icon so done use it first use other ones before it.
 */
//Libraries
import processing.sound.*;
//SOUNDS
SoundFile beg;
SoundFile gam;

//Variables
//STAGE 0
PImage intro;
PImage back;
int opacity = 255;
int click = 0;
//STAGE 1
PImage inst;
int start;
//STAGE 2
PImage atmos;
PImage sky;
PImage ground;
PImage star;
PImage win1;
PImage lose1;
float timer;
//star selection
PImage ca; //cancer
PImage cm; //canis major
PImage gm; //gemini
PImage lm; //leo minor
PImage lo; //leo
PImage or; //orion
int ca1 = 0; // 0 = false 1 = true 3 = placed!
int cm1 = 0;
int gm1 = 0;
int lm1 = 0;
int lo1 = 0;
int or1 = 0;
//end star selection
//updating starmap
PImage Cancer;
PImage Canism;
PImage Gemini;
PImage Leom;
PImage Leo;
PImage Orion;
//end updating star map
//star facts
PImage CanPic;
PImage CaniPic;
PImage GemPic;
PImage LeomPic;
PImage LeoPic;
PImage OriPic;
//end star facts
int sections;
int x = 0;
int win = 0;
int lose = 0;
int points = 0;
float y = 0;
float nsec; //new section command
float imgtimer; 
//STAGE CONTROL
int stages;

//Setup
void setup() {
  size(1200, 749);
  //Sounds
  beg = new SoundFile(this, "beg.mp3");
  gam = new SoundFile(this, "gam.mp3");
  //STAGE 0
  intro = loadImage("intro.jpg");
  back = loadImage("back.jpg");
  //STAGE 1
  inst = loadImage("inst.jpg");
  start = 0;
  //STAGE 2 [GAME]
  atmos = loadImage("atmos.jpg");
  sky = loadImage("sky.jpg");
  ground = loadImage("ground.jpg");
  star = loadImage("star.png");
  win1 = loadImage("win.jpg");
  lose1 = loadImage("lose.jpg");
  //star selection
  ca = loadImage("ca.png"); //cancer
  cm = loadImage("cm.png"); //canis major
  gm = loadImage("gm.png"); //gemini
  lm = loadImage("lm.png"); //leo minor
  lo = loadImage("lo.png"); //leo
  or = loadImage("or.png"); //orion
  //end star selection
  //updating starmap
  Cancer = loadImage("Cancer.png");
  Canism = loadImage("Canis Major.png");
  Gemini = loadImage("Gemini.png");
  Leom = loadImage("Leo Minor.png");
  Leo = loadImage("Leo.png");
  Orion = loadImage("Orion.png");
  //end updating star map
  //star facts
  CanPic = loadImage("CanPic.png");
  CaniPic = loadImage("CaniPic.png");
  GemPic = loadImage("GemPic.png");
  LeomPic = loadImage("LeomPic.png");
  LeoPic = loadImage("LeoPic.png");
  OriPic = loadImage("OriPic.png");
  //end star facts
  timer = 21;
  sections = 1; //ATMOS = 1, SKY = 2, GROUND = 3
  imgtimer = 6;
  //setup
  background(intro);
  stages = 0;
}
void draw() {
  //Intro Menu
  if (stages == 0) {
    if (mousePressed) {
      click = 1;
    }
    if (click==1) {
      background(back);
      tint(255, opacity);
      image(intro, 0, 0);
      opacity = opacity - 5;
      if (opacity == -10) {
        stages = 1;
      }
    }
  }
  //STAGE 2 [INSTRUCTIONS]
  if (stages == 1) {
    if (x == 0) {
      beg.play();
      x = 1;
    }
    tint(255, opacity);
    image(inst, 0, 0);
    opacity = opacity + 5;
    if (keyPressed) {
      if (keyCode == ENTER || keyCode == RETURN) {
        beg.stop();
        start = 1;
      }
    }
  }
  if (start == 1 && stages == 1) {
    tint(255, 255);
    image(back, 0, 0);
    opacity = -10;
    beg.pause();
    stages = 2;
  }
  //STAGE 3 [GAME]
  if (stages == 2) {
    if(x == 1){
    gam.play();
    x = 2;
    }
    stroke(0);
    imageMode(CORNER);
    if (sections < 3) {
      background(0);
    }
    if (sections == 3) {
      background(255);
    }
    //section 1

    if (sections == 1) {
      tint(255, opacity);
      image(atmos, 0, y);
      textSize(50);
      fill(255, 255, 255, 255);
      text(timer, 0, 50);
      rectMode(CENTER);
      if (timer > 0) {
        y = y - 0.5;
        timer = timer - 0.05;
        opacity = opacity + 10;
        //number correct stuff
      } else {
        timer = 0;
        delay(3000);
        if (points >= 2) {
          image(atmos, 0, y);
          opacity = -10;
          timer = 20;
          sections = 2;
        } else {
          lose = 1;
        }
      }
    }
    //section 2
    if (sections == 2) {
      tint(255, opacity);
      image(sky, 0, 0, width, height);
      textSize(50);
      fill(255, 255, 255, 255);
      text(timer, 0, 50);
      if (timer > 0) {
        timer = timer - 0.05;
        opacity = opacity + 10;
        //number correct stuff
      } else {
        timer = 0;
        delay(3000);
        if (points >= 4) {
          opacity = -10;
          timer = 20;
          sections = 3;
        } else {
          lose = 1;
        }
      }
    }
    //section 3
    if (sections == 3) {
      tint(255, opacity);
      image(ground, 0, 0, width, height);
      textSize(50);
      fill(0, 0, 0, 255);
      text(timer, 0, 50);
      if (timer > 0) {
        timer = timer - 0.05;
        opacity = opacity + 10;
        //number correct stuff
      } else {
        timer = 0;
        delay(3000);
        if (points == 6) {
          opacity = -10;
          win = 1;
        } else {
          lose = 1;
        }
      }
    }

    if (sections <= 2) {
      fill(0, 0, 0, 100);
      rect(width/2, height/2-50, 900, 400, 50);
      imageMode(CENTER);
      image(star, width/2, height/2-50, 900, 400);
    }
    if (sections == 3) {
      fill(0, 0, 0, 100);
      rect(width/2, height/2-50, 900, 400, 50);
      fill(255, 255, 255);
      stroke(255);
      ellipse(random(150, 1050), random(124.5, 524.5), 7, 7);
      ellipse(random(150, 1050), random(124.5, 524.5), 7, 7);
      ellipse(random(150, 1050), random(124.5, 524.5), 7, 7);
      imageMode(CENTER);
      image(star, width/2, height/2-50, 900, 400);
    }
    //tiles and gameboard
    fill(120, 120, 120, 220);
    rect(width/2, height/2+250, 900, 200, 50);
    imageMode(CENTER);
    //tiles
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //CANCER
    if (mousePressed) {
      if (ca1 == 0 || ca1 == 4 && cm1 == 0 || cm1 == 4 && gm1 == 0 || gm1 == 4 && lm1 == 0 || lm1 == 4 && lo1 == 0 || lo1 == 4 && or1 == 0 || or1 == 4) {
        if (mouseX < 294 && mouseX > 186 && mouseY < 727.5 && mouseY > 532.5 && ca1 == 0) {
          ca1 = 1;
        }
        if (mouseX < 470.5 && mouseX > 327.5 && mouseY < 501 && mouseY > 271 && ca1 == 1) {
          ca1 = 3;
          points = points + 1;
        }
      }
    }
    if (ca1 == 1) {
      image(ca, mouseX, mouseY, 143, 230);
    }
    if (ca1 >= 3) {
      image(Cancer, width/2, height/2-50, 900, 400 );
      
    }
    if(ca1 == 3){
        imgtimer = imgtimer + 0.03;
        image(CanPic, 80,350);
        if(imgtimer > 7){
          imgtimer = 6;
          ca1 = 4;
        }
      }
    image(ca, 240, 630, 108, 195);
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //CANIS MAJOR
    if (mousePressed) {
      if (ca1 == 0 || ca1 == 4 && cm1 == 0 || cm1 == 4 && gm1 == 0 || gm1 == 4 && lm1 == 0 || lm1 == 4 && lo1 == 0 || lo1 == 4 && or1 == 0 || or1 == 4) {
        if (mouseX < 451 && mouseX > 309 && mouseY < 711.5 && mouseY > 548.5 && cm1 == 0) {
          cm1 = 1;
        }
        if (mouseX < 744 && mouseX > 582 && mouseY < 510.5 && mouseY > 327.5 && cm1 == 1) {
          cm1 = 3;
          points = points + 1;
        }
      }
    }
    if (cm1 == 1) {
      image(cm, mouseX, mouseY, 162, 183);
    }
    if (cm1 >= 3) {
      image(Canism, width/2, height/2-50, 900, 400);
    }
    if(cm1 == 3){
        imgtimer = imgtimer + 0.03;
        image(CaniPic, 80,350);
        if(imgtimer > 7){
          imgtimer = 6;
          cm1 = 4;
        }
      }
    //display in game
    image(cm, 380, 630, 142, 163);
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //Gemini
    if (mousePressed) {
      if (ca1 == 0 || ca1 == 4 && cm1 == 0 || cm1 == 4 && gm1 == 0 || gm1 == 4 && lm1 == 0 || lm1 == 4 && lo1 == 0 || lo1 == 4 && or1 == 0 || or1 == 4) {
        if (mouseX < 643 && mouseX > 437 && mouseY < 715.5 && mouseY > 544.5 && gm1 == 0) {
          gm1 = 1;
        }
        if (mouseX < 937 && mouseX > 711 && mouseY < 374.5 && mouseY > 183.5 && gm1 == 1) {
          gm1 = 3;
          points = points + 1;
        }
      }
    }
    if (gm1 == 1) {
      image(gm, mouseX, mouseY, 226, 191);
    }
    if (gm1 >= 3) {
      image(Gemini, width/2, height/2-50, 900, 400);
    }
    if(gm1 == 3){
        imgtimer = imgtimer + 0.03;
        image(GemPic, 80,350);
        if(imgtimer > 7){
          imgtimer = 6;
          gm1 = 4;
        }
      }
    //display in game
    image(gm, 540, 630, 206, 171);
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //Leo Minor
    if (mousePressed) {
      if (ca1 == 0 || ca1 == 4 && cm1 == 0 || cm1 == 4 && gm1 == 0 || gm1 == 4 && lm1 == 0 || lm1 == 4 && lo1 == 0 || lo1 == 4 && or1 == 0 || or1 == 4) {
        if (mouseX < 779.5 && mouseX > 620.5 && mouseY < 706.5 && mouseY > 553.5 && lm1 == 0) {
          lm1 = 1;
        }
        if (mouseX < 281.5 && mouseX > 182.5 && mouseY < 496.5 && mouseY > 403.5 && lm1 == 1) {
          lm1 = 3;
          points = points + 1;
        }
      }
    }
    if (lm1 == 1) {
      image(lm, mouseX, mouseY, 99, 93);
    }
    if (lm1 >= 3) {
      image(Leom, width/2, height/2-50, 900, 400);
    }
    if(lm1 == 3){
        imgtimer = imgtimer + 0.03;
        image(LeomPic, 80,350);
        if(imgtimer > 7){
          imgtimer = 6;
          lm1 = 4;
        }
      }
    //display in game
    image(lm, 700, 630, 159, 153);
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //Leo
    if (mousePressed) {
      if (ca1 == 0 || ca1 == 4 && cm1 == 0 || cm1 == 4 && gm1 == 0 || gm1 == 4 && lm1 == 0 || lm1 == 4 && lo1 == 0 || lo1 == 4 && or1 == 0 || or1 == 4) {
        if (mouseX < 920 && mouseX > 740 && mouseY < 723.5 && mouseY > 516.5 && lo1 == 0) {
          lo1 = 1;
        }
        if (mouseX < 428 && mouseX > 188 && mouseY < 412.5 && mouseY > 145.5 && lo1 == 1) {
          lo1 = 3;
          points = points + 1;
        }
      }
    }
    if (lo1 == 1) {
      image(lo, mouseX, mouseY, 240, 267);
    }
    if (lo1 >= 3) {
      image(Leo, width/2, height/2-50, 900, 400);
    }
    if(lo1 == 3){
        imgtimer = imgtimer + 0.03;
        image(LeoPic, 80,350);
        if(imgtimer > 7){
          imgtimer = 6;
          lo1 = 4;
        }
      }
    //display in game
    image(lo, 830, 620, 180, 207);
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //Orion
    if (mousePressed) {
      if (ca1 == 0 || ca1 == 4 && cm1 == 0 || cm1 == 4 && gm1 == 0 || gm1 == 4 && lm1 == 0 || lm1 == 4 && lo1 == 0 || lo1 == 4 && or1 == 0 || or1 == 4) {
        if (mouseX < 1059.5 && mouseX > 880.5 && mouseY < 754.5 && mouseY > 525.5 && or1 == 0) {
          or1 = 1;
        }
        if (mouseX < 670.5 && mouseX > 431.5 && mouseY < 396.5 && mouseY > 107.5 && or1 == 1) {
          or1 = 3;
          points = points + 1;
        }
      }
    }
    if (or1 == 1) {
      image(or, mouseX, mouseY, 239, 289);
    }
    if (or1 >= 3) {
      image(Orion, width/2, height/2-50, 900, 400);
    }
    if(or1 == 3){
        imgtimer = imgtimer + 0.03;
        image(OriPic, 80,350);
        if(imgtimer > 7){
          imgtimer = 6;
          or1 = 4;
        }
      }
    //display in game
    image(or, 970, 640, 179, 229);
    //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    //end tiles
    fill(255, 255, 255, 255);
    //text(mouseX + "," + mouseY, 0, 749);
    //displaying points
    textSize(20);
    if (sections <= 2) {
      fill(255);
      text("You have " + points + " points!", 950, 25);
      textSize(15);
      fill(255, 0, 0);
      text("You need to get at least 2 points for each stage!", 825, 45);
    } else {
      fill(0);
      text("You have " + points + " points!", 950, 25);
      textSize(15);
      fill(255, 0, 0);
      text("You need to get at least 2 points for each stage!", 825, 45);
    }
    //win
    if (win == 1) {
      sections = 4;
      image(win1, width/2, height/2);
    }
    //lose
    if (lose == 1) {
      sections = 4;
      image(lose1, width/2, height/2);
    }
  }
}

//TO START THE GAME
void keyPressed() {
  if (keyCode == ENTER) {
    start = 1;
  }
  if (key == 'r' || key == 'R') {
    if (lose == 1) {
      imageMode(CORNER);
      timer = 21;
      sections = 1;
      opacity = 255;
      click = 0;
      ca1 = 0; // 0 = false 1 = true 3 = placed!
      cm1 = 0;
      gm1 = 0;
      lm1 = 0;
      lo1 = 0;
      or1 = 0;
      x = 0;
      win = 0;
      lose = 0;
      points = 0;
      y = 0;
      start = 0;
      background(intro);
      gam.pause();
      stages = 0;
    }
  }
}
