//ver 1.2

import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;
AudioOutput out;
Sampler [] note = new Sampler[5];
int line0, line1, line2, line3;
int xVar = 50;

void setup() {
  size(1000, 1000);
  minim = new Minim(this);
  out = minim.getLineOut();
  note[0] = new Sampler("Piano_3.mp3", 4000, minim);
  note[1] = new Sampler("Piano_10.mp3", 4, minim);
  note[2] = new Sampler("Piano_28.mp3", 4, minim);
  note[3] = new Sampler("Piano_21.mp3", 4, minim);
  note[4] = new Sampler("Piano_19.mp3", 4, minim);
  for(int i = 0; i < 5; i++) note[i].patch( out );
}

void draw() {
  background(0);
  stroke(255, 0, 0);
  line0 = 256;
  line1 = 270;
  line2 = width-line1;
  line3 = height-(height-line0)/2;
  if(mouseY > line3 && mouseX < line1) note[0].trigger();
  if(mouseY < line3 && mouseY > line0 && mouseX < line1) note[1].trigger();
  if(mouseY < line0 && mouseX > line1 && mouseX < line2) note[2].trigger();
  if(mouseY > line0 && mouseY < line3 && mouseX > line2) note[3].trigger();
  if(mouseY > line3 && mouseX > line2) note[4].trigger();
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

void keyPressed() {
  if (key == 's') note[0].trigger();
  if (key == 'k') note[1].trigger();
}
