import java.util.Scanner;
import java.lang.Math;
boolean hasStarted;
boolean hasGottenSide1 = false;
boolean hasGottenSide2 = false;
boolean isDone = false;
String input;
int side1;
int side2;
void setup() {
  hasStarted = false;
  size(500, 500);//must be a square
  background(255);
  textSize(25);
  fill(0);
  textAlign(CENTER, CENTER);
  input = "";
}

void draw() {
  background(255);
  if (!hasStarted) {
    if(!hasGottenSide1){
      text("Please enter number 1", width/2, height/2);
    }
    else if(!hasGottenSide2){
      text("Please enter number 2", width/2, height/2);
    }
  } 
  else if(isDone){
    //we need to draw the square here
    drawRect(side1, side2);
  }
  else {
    fill(0);
    text(input, width/2, height/2);
  }
}

void keyPressed(){
  hasStarted = true;
  int keyNum = Character.getNumericValue(key);
  if(keyNum <= 9){
    input += key;
  }
  if(key ==  BACKSPACE){
    input = input.substring(0, input.length()-2);
  }
  else if(key ==  ENTER){
    Scanner scan = new Scanner(input);
    if(!hasGottenSide1){
      side1 = scan.nextInt();
      hasGottenSide1 = true;
      //print(side1);
      setup();
    }
    else if(!hasGottenSide2){
      side2 = scan.nextInt();
      hasGottenSide2 = true;
      hasStarted = true;
      isDone = true;
    }
    scan.close();
  }
}

void drawRect(int s1, int s2){
  int expNum = getNumScales(Math.max(s1, s2));
  print("expNum = "+expNum+"\n");
  int ns1 = s1*expNum;
  int ns2 = s2*expNum;
  rect(width/2 - ns1/2, height/2 - ns2/2, ns1, ns2);
  int gcd = fillIn(width/2 - ns1/2, height/2 - ns2/2, ns1, ns2)/expNum;
  text("GCD of "+s1+" and "+s2+" is "+gcd, width/2, 10);
  print("GCD = "+gcd);
  noLoop();
}

int getNumScales(int n){
  int num = 0;
  int winMax = width - width/20;
  //if(n >= winMax){
  //  while(num / n > winMax){
  //    num++;
  //  }
  //}
  while(num * n < winMax){
    num++;
  }
  return num-1;
}

int round = 0;
int fillIn(int cx, int cy, int w, int h){
  //delay(1000);
  fill(12, 187, 209);
  round++;
  
  int small = Math.min(w, h);
  rect(cx, cy, small, small);
  if(w > h){// long and short
    w -= h;
    cx += h;
  }
  else if(h>w){//tall & skinny
    h -= w;
    cy += w;
  }
  else{
    return Math.min(h, w);
  }
  print("round "+round+", w="+w+" h="+h+"\n");
  return fillIn(cx, cy, w, h);
}