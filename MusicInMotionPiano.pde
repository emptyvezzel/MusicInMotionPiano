//ver 1.3

//import ddf.minim.*;
//import ddf.minim.ugens.*;
import processing.sound.*;
//Minim minim;
//AudioOutput out;
SoundFile [] note = new SoundFile[5];
int line0, line1, line2, line3;
int xVar = 50;
boolean playing = false;

void setup() {
  size(1000, 1000);
  //minim = new Minim(this);
  //out = minim.getLineOut();
  note[0] = new SoundFile(this, "Piano_3.mp3");
  note[1] = new SoundFile(this, "Piano_10.mp3");
  note[2] = new SoundFile(this, "Piano_28.mp3");
  note[3] = new SoundFile(this, "Piano_21.mp3");
  note[4] = new SoundFile(this, "Piano_19.mp3");
  //for(int i = 0; i < 5; i++) note[i].patch( out );
}

void draw() {
  background(0);
  stroke(255, 0, 0);
  line0 = 256;
  line1 = 270;
  line2 = width-line1;
  line3 = height-(height-line0)/2;
  if(note[0].isPlaying() == false && note[1].isPlaying() == false && 
  note[2].isPlaying() == false && note[3].isPlaying() == false && 
  note[4].isPlaying() == false) playing = false;
  else playing = true;
  if(mouseY > line3 && mouseX < line1 && playing == false) note[0].play();
  if(mouseY < line3 && mouseY > line0 && mouseX < line1 && playing == false) note[1].play();
  if(mouseY < line0 && mouseX > line1 && mouseX < line2 && playing == false) note[2].play();
  if(mouseY > line0 && mouseY < line3 && mouseX > line2 && playing == false) note[3].play();
  if(mouseY > line3 && mouseX > line2 && playing == false) note[4].play();
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
