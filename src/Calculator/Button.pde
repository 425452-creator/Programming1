class Button {
  String btxt;
  float bx, by, w, h;
  char tval;
  boolean hover;
  color c1, c2;
  float bsf;

  //constructor
  Button(String btxt, float bx, float by, float w, float h, char tval,
    float bsf) {
    this.btxt=btxt;
    this.bx=bx;
    this.by=by;
    this.tval=tval;
    this.w=w;
    this.h=h;
    this.bsf=bsf;
    c1=(127);
    c2=(180);
    hover= false;
  }

  //member methods
  void update() {
    
  }

  void display() {
    rectMode(CENTER);
    if (hover == true) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(bx*bsf, by*bsf, w*bsf, h*bsf, 5, 5, 5, 5);
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text(btxt, bx*bsf, by*bsf);
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX>bx*bsf-(w*bsf)/2 && tempX<(bx*bsf)+(w*bsf)/2 && tempY>by*bsf-(h*bsf)/2 && tempY<by*bsf+(h*bsf)/2) {
      hover=true;
    } else {
      hover = false;
    }
  }
}
