//Anders Millican | 15 Sept 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
float sf; //= scale factor
float l, r, result;
char op;
boolean left, newEntry;
String displayVal;
int n;

void setup() {
  n=0;
  l = 0.0;
  r=0.0;
  result=0.0;
  op = ' ';
  left = true;
  newEntry= true;
  displayVal = "0.0";
  sf=30.00;
  size(390, 660); // must manually adjust sf here.
  longmess();
}

void draw() {
  background(200);
  for (int i = 0; i < numButtons.length; i++) {
    //buttons[i].update();
    numButtons[i].mouseOver(mouseX, mouseY);
    numButtons[i].display();
  }
  for (int i = 0; i < opButtons.length; i++) {
    //buttons[i].update();
    opButtons[i].mouseOver(mouseX, mouseY);
    opButtons[i].display();
  }
  drawDisplay();
  //println(result);
}

void longmess() {
  // top row - operators
  opButtons[0]= new Button("+", 2, 5, 2, 2, '+', sf);
  opButtons[1]= new Button("-", 5, 5, 2, 2, '-', sf);
  opButtons[2]= new Button("*", 8, 5, 2, 2, '*', sf);
  opButtons[3]= new Button("/", 11, 5, 2, 2, '/', sf);

  // numberpad
  numButtons[0]= new Button("0", 5, 17, 2, 2, '0', sf);
  numButtons[1]= new Button("1", 2, 14, 2, 2, '1', sf);
  numButtons[2]= new Button("2", 5, 14, 2, 2, '2', sf);
  numButtons[3]= new Button("3", 8, 14, 2, 2, '3', sf);
  numButtons[4]= new Button("4", 2, 11, 2, 2, '4', sf);
  numButtons[5]= new Button("5", 5, 11, 2, 2, '5', sf);
  numButtons[6]= new Button("6", 8, 11, 2, 2, '6', sf);
  numButtons[7]= new Button("7", 2, 8, 2, 2, '7', sf);
  numButtons[8]= new Button("8", 5, 8, 2, 2, '8', sf);
  numButtons[9]= new Button("9", 8, 8, 2, 2, '9', sf);

  // extra buttons
  opButtons[4]= new Button("cl", 2, 17, 2, 2, 'f', sf);
  opButtons[5]= new Button(".", 8, 17, 2, 2, '.', sf);
  opButtons[6]= new Button("^", 2, 20, 2, 2, 'a', sf);
  opButtons[7]= new Button("Sin", 5, 20, 2, 2, 'b', sf);
  opButtons[8]= new Button("Cos", 8, 20, 2, 2, 'c', sf);
  opButtons[9]= new Button("Tan", 11, 20, 2, 2, 'd', sf);

  //Long buttons
  opButtons[10]= new Button("±", 11, 9.5, 2, 5, 'g', sf);
  opButtons[11]= new Button("=", 11, 15.5, 2, 5, 'e', sf);
}

void drawDisplay() {
  rectMode(CENTER);
  fill(255);
  rect(width/2, 2*sf, width-2*sf, 2*sf);
  fill(127);
  textAlign(RIGHT, CENTER);
  text(displayVal, width-1.5*sf, 2*sf);
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handl(numButtons[i].btxt.charAt(0), true);
    }
  }
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      char clicked = opButtons[i].btxt.charAt(0);
      handl(clicked, false);
    }
  }
  n += 1;
  println("L:" + l);
  println("R:" + r);
  println("Res:" + result);
  println("Left:" + left);
  println("Op:" + op);
  println(n);
}



void doTheMath() {
  if (op == '+') {
    result=r+l;
  } else if (op == '-') {
    result=l-r;
  } else if (op == '*') {
    result=r*l;
  } else if (op == '/') {
    result=l/r;
  } else if (op == '^') {
    result=pow(l, r);
  }

  displayVal = str(result);
  left = !left;
  l=result;
  r=0.0;
}

void keyPressed() {
  println("KeyConde: " +keyCode);
  //displayVal = str(key);
  if (keyCode == 48 || keyCode == 96) {
    handl('0', true);
  } else if (keyCode == 49 || keyCode == 98) {
    handl('1', true);
  } else if (keyCode == 50 || keyCode == 99) {
    handl('2', true);
  } else if (keyCode == 51 || keyCode == 100) {
    handl('3', true);
  } else if (keyCode == 52 || keyCode == 101) {
    handl('4', true);
  } else if (keyCode == 53 || keyCode == 102) {
    handl('5', true);
  } else if (keyCode == 54 || keyCode == 103) {
    handl('6', true);
  } else if (keyCode == 55 || keyCode == 104) {
    handl('7', true);
  } else if (keyCode == 56 || keyCode == 105) {
    handl('8', true);
  } else if (keyCode == 57 || keyCode == 106) {
    handl('9', true);
  } else if (keyCode == 61 || keyCode == 10) {
    handl('=', false);
  } else if (keyCode == 107 ) {
    handl('+', false);
  } else if (keyCode == 109 || keyCode == 45 ) {
    handl('-', false);
  } else if (keyCode == 47 || keyCode == 111 ) {
    handl('-', false);
  } else if (keyCode == 106 ) {
    handl('*', false);
  } else if (keyCode == 80 ) {
    handl('±', false);
  } else if (keyCode == 46 || keyCode == 110 ) {
    handl('.', false);
  } else if (keyCode == 83) {
    handl('S', false);
  } else if (keyCode == 67) {
    handl('C', false);
  } else if (keyCode == 84) {
    handl('T', false);
  } else if (keyCode == 8 || keyCode == 127 ) {
    handl('c', false);
  } else if (keyCode == 38) {
    handl('^', false);
  }
}

void handl(char val, boolean isNum) {
  if (isNum == true) {
    //Do some numerical alakazam
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal=digit;
      newEntry= false;
    } else {
      displayVal += digit;
    }
    if (left) {
      l=float(displayVal);
    } else {
      r=float(displayVal);
    }
  } else {
    //Perform some operational mumbo jumbo
    char clicked = val;

    if (clicked == '=') {
      doTheMath();
    } else if (clicked == '+' || clicked == '-' || clicked == '*' || clicked == '/' || clicked == '^') {
      op = clicked;
      left = !left;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'c') {
      l = 0.0;
      r=0.0;
      result=0.0;
      op = ' ';
      left = true;
      newEntry= true;
      displayVal = "0.0";
    } else if (clicked == 'S') {
      if (left == true) {
        l = sin(l);
        displayVal = str(l);
      } else {
        r = sin(r);
        displayVal = str(r);
      }
    } else if (clicked == 'C') {
      if (left == true) {
        l = cos(l);
        displayVal = str(l);
      } else {
        r = cos(r);
        displayVal = str(r);
      }
    } else if (clicked == 'T') {
      if (left == true) {
        l = tan(l);
        displayVal = str(l);
      } else {
        r = tan(r);
        displayVal = str(r);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal += ".";
      }
    }
  }
}
