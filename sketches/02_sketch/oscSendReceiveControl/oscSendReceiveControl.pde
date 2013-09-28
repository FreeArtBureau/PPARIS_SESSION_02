/**
 * oscP5broadcastTester by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/
 */

import controlP5.*; 
import oscP5.*;
import netP5.*;


ControlP5 controlP5;  
OscP5 oscP5;
NetAddress myRemoteLocation;


float randomFlux = 0;


void setup() {
  size(400, 400);

  smooth();
  controlP5 = new ControlP5(this);  
  controlP5.addSlider("randomFlux", 0, 255, 0, 100, 260, 100, 14);


  oscP5 = new OscP5(this, 5001);

  myRemoteLocation = new NetAddress("127.0.0.1", 5001);
}


void draw() {
  background(000);  

  fill(randomFlux);
  rect(0, 0, width, 100);



  OscMessage myMessage = new OscMessage("/test");

  myMessage.add(randomFlux); 


  println(randomFlux);

  oscP5.send(myMessage, myRemoteLocation);
}






void oscEvent(OscMessage theOscMessage) {
  print("### received an osc message.");
  println(" "+theOscMessage.addrPattern());
}

