//ver 1.1

import processing.sound.*;
SoundFile happy0, happy1, sad0, sad1, weird;
int line0, line1, line2, line3;
int xVar = 50;

void setup(){
  size(1000, 1000);
  happy0 = new SoundFile(this, "Piano_3.wav");
  happy1 = new SoundFile(this, "Piano_10.wav");
  sad0 = new SoundFile(this, "Piano_28.wav");
  sad1 = new SoundFile(this, "Piano_21.wav");
  weird = new SoundFile(this, "Piano_19.wav");
}

void draw(){
  background(0);
  stroke(255, 0, 0);
  line0 = 256;
  line1 = 270;
  line2 = width-line1;
  line3 = height-(height-line0)/2;
  if(mouseY > line3 && mouseX < line1) happy0.play();
  if(mouseY < line3 && mouseY > line0 && mouseX < line1) happy1.play();
  if(mouseY < line0 && mouseX > line1 && mouseX < line2) sad0.play();
  if(mouseY > line0 && mouseY < line3 && mouseX > line2) sad1.play();
  if(mouseY > line3 && mouseX > line2) weird.play();
  line(0, line0, width, line0);
  line(line1, 0, line1, height);
  line(line2, 0, line2, height);
  line(0, line3, line1, line3);
  line(line2, line3, width, line3);
  textSize(30);
  fill(255, 0, 0);
  text("1", 500, 111);
  text("2", 100, 451);
  text("3", 100, 820);
  text("4", 858, 450);
  text("5", 866, 842);
}