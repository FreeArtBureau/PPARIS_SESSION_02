/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 */
 
import controlP5.*; 
import oscP5.*;
import netP5.*;
  
  
ControlP5 controlP5;  
OscP5 oscP5;
NetAddress myRemoteLocation;


int flux = 0;


void setup() {
  size(400,400);
  frameRate(25);
  
  smooth();
  controlP5 = new ControlP5(this);  
  controlP5.addSlider("flux", 0, 255, 0, 100, 260, 100, 14);

  
  
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress("127.0.0.1",12000);
}


void draw() {
  background(000);  
  
  fill(flux);
  rect(0,0,width,100);
  
  
  OscMessage myMessage = new OscMessage("/test");
  
  myMessage.add(flux); /* add an int to the osc message */
  
  
  println(flux);
  
  /* send the message */
  oscP5.send(myMessage, myRemoteLocation); 

  
}





/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
