
/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 * Commentaires et traduction Stéphane Buellet http://www.chevalvert.fr
 */


import oscP5.*;
import netP5.*;


//ajout pour randomFlux
float n = 0.0;
float xincrement = 0.01; 
float randomFlux = 0.0;


OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(400, 400);
frameRate(30);

  oscP5 = new OscP5(this, 5001);


  myRemoteLocation = new NetAddress("127.0.0.1", 5001);
}

void draw()
{

  ellipse(randomFlux, randomFlux ,randomFlux, randomFlux);

  OscMessage myMessage = new OscMessage("/test");

  //ajout pour randomFlux
  
 
   // Get a noise value based on xoff and scale it according to the window's width
  randomFlux = noise(n)*255;
  
  // With each cycle, increment xoff
  n += xincrement; 
  
  myMessage.add(randomFlux); 
  println(randomFlux);


  oscP5.send(myMessage, myRemoteLocation);
}



void oscEvent(OscMessage theOscMessage) 
{  

  println("OSC Message Recieved: ");
  println(theOscMessage.addrPattern() + " ");
}

