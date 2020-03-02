//ver 1.6
//Music in Motion Piano Version 
//by Jack Murphy, Anshuman Sahu, Lauren Arzbaecher and Ryan Fairweather
//uses code from Thomas Sanchez Lengeling's "SkeletonColor.pde" example sketch
//from the KinectPV2 library for processing
import processing.sound.*;
import KinectPV2.KJoint;
import KinectPV2.*;
SoundFile [] note = new SoundFile[5];
int line0, line1, line2, line3;
int xVar = 50;
float leftHandX;
float leftHandY;
float rightHandX;
float rightHandY;
boolean playing = false;
KinectPV2 kinect;
KJoint[] joints;

void setup() {
  fullScreen(P3D);
  kinect = new KinectPV2(this);
  kinect.enableSkeletonColorMap(true);
  kinect.enableColorImg(true);
  kinect.init();
  note[0] = new SoundFile(this, "Piano_03.mp3");
  note[1] = new SoundFile(this, "Piano_10.mp3");
  note[2] = new SoundFile(this, "Piano_28.mp3");
  note[3] = new SoundFile(this, "Piano_21.mp3");
  note[4] = new SoundFile(this, "Piano_19.mp3");
}

void draw() {
  background(0);
  strokeWeight(2.0);
  image(kinect.getColorImage(), 0, 0, width, height);
  ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
      color col  = skeleton.getIndexColor();
      fill(col);
      stroke(col);
      drawBody(joints);
      //draw different color for each hand state
      drawHandState(joints[KinectPV2.JointType_HandRight]);
      drawHandState(joints[KinectPV2.JointType_HandLeft]);
      //getting limb Variables
      leftHandX = joints[KinectPV2.JointType_HandLeft].getX();
      leftHandY = joints[KinectPV2.JointType_HandLeft].getY();
      rightHandX = joints[KinectPV2.JointType_HandRight].getX();
      rightHandY = joints[KinectPV2.JointType_HandRight].getY();
    }
  }
  stroke(255, 0, 0);
  strokeWeight(20.0);
  line0 = 275;
  line1 = 675;
  line2 = width-line1;
  line3 = height-(height-line0)/2;
  if (note[0].isPlaying() == false && note[1].isPlaying() == false && 
    note[2].isPlaying() == false && note[3].isPlaying() == false && 
    note[4].isPlaying() == false) playing = false;
  else playing = true;
  if (leftHandY > line3 && leftHandX < line1 && playing == false) note[0].play();
  if (leftHandY > line0 && leftHandX < line1 && leftHandY < line3 && playing == false) note[1].play();
  if (leftHandY < line0 && leftHandX > line1 && leftHandX < line2 && playing == false) note[2].play();
  if (leftHandY > line0 && leftHandY < line3 && leftHandX > line2 && playing == false) note[3].play();
  if (leftHandY > line3 && leftHandX > line2 && playing == false) note[4].play();
  if (rightHandY > line3 && rightHandX < line1 && playing == false) note[0].play();
  if (rightHandY > line0 && rightHandX < line1 && rightHandY < line3 && playing == false) note[1].play();
  if (rightHandY < line0 && rightHandX > line1 && rightHandX < line2 && playing == false) note[2].play();
  if (rightHandY > line0 && rightHandY < line3 && rightHandX > line2 && playing == false) note[3].play();
  if (rightHandY > line3 && rightHandX > line2 && playing == false) note[4].play();
  line(0, line0, width, line0);
  line(line1, 0, line1, height);
  line(line2, 0, line2, height);
  line(0, line3, line1, line3);
  line(line2, line3, width, line3);
  textSize(150);
  fill(255, 0, 0);
  text("1", width/2, line0/2);
  text("2", line1/2, 451);
  text("3", line1/2, 820);
  text("4", width-line1/2, 450);
  text("5", width-line1/2, 842);
  //text(frameRate, 50, 50);
}

//DRAW BODY
void drawBody(KJoint[] joints) {
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);
  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

  // Right Arm
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);

  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
}

//draw joint
void drawJoint(KJoint[] joints, int jointType) {
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
}

//draw bone
void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  ellipse(0, 0, 25, 25);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

//draw hand state
void drawHandState(KJoint joint) {
  noStroke();
  handState(joint.getState());
  pushMatrix();
  translate(joint.getX(), joint.getY(), joint.getZ());
  ellipse(0, 0, 70, 70);
  popMatrix();
}

/*
Different hand state
 KinectPV2.HandState_Open
 KinectPV2.HandState_Closed
 KinectPV2.HandState_Lasso
 KinectPV2.HandState_NotTracked
 */
void handState(int handState) {
  switch(handState) {
  case KinectPV2.HandState_Open:
    fill(0, 255, 0);
    break;
  case KinectPV2.HandState_Closed:
    fill(255, 0, 0);
    break;
  case KinectPV2.HandState_Lasso:
    fill(0, 0, 255);
    break;
  case KinectPV2.HandState_NotTracked:
    fill(255, 255, 255);
    break;
  }
}
