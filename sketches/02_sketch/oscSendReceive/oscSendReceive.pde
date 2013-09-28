
/**
 * oscP5sendreceive by andreas schlegel
 * example shows how to send and receive osc messages.
 * oscP5 website at http://www.sojamo.de/oscP5
 * Commentaires et traduction Stéphane Buellet http://www.chevalvert.fr
 */
 


import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress myRemoteLocation;
 
void setup() {
  size(400,400);
 
  // on démarre oscP5 en lui disant d'écouter les messages venant du port 5001 */
  oscP5 = new OscP5(this,5001);
 
  // on règle l'emplacement distant en local sur le port 5001
  myRemoteLocation = new NetAddress("127.0.0.1",5001);
}
 
void draw()
{
 
}
 
void mousePressed() {  
  // création du message OSC que l'on nomme /test
  OscMessage myMessage = new OscMessage("/test");
 
  myMessage.add(123); // ajout d'une valeur intégrale (int)
  myMessage.add(12.34); // ajout d'une valeur flottante (float) 
  myMessage.add("some text!"); //  ajout d'une phrase (string)
 
  // envoi du message
  oscP5.send(myMessage, myRemoteLocation); 
}
 
 
void oscEvent(OscMessage theOscMessage) 
{  
  // on récupère la première valeur comme une intégrale
  int firstValue = theOscMessage.get(0).intValue();
 
  // on récupère la première valeur comme un nombre à virgule
  float secondValue = theOscMessage.get(1).floatValue();
 
  // on récupère la première valeur comme une phrase
  String thirdValue = theOscMessage.get(2).stringValue();
 
  // Et on écrit dans la console le message en ajouté les valeurs à la suite
  print("OSC Message Recieved: ");
  print(theOscMessage.addrPattern() + " ");
  println(firstValue + " " + secondValue + " " + thirdValue);
}
