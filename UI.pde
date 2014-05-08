class UI {
  
  Button button1 = new Button(670, 10, 110, 30, "createCube");
  Button button2 = new Button(670, 60, 110, 30, "transfCube");
  Button button3 = new Button(670, 110, 110, 30, "createObject");
  Button button4 = new Button(670, 160, 110, 30, "transfObject");
  Button button5 = new Button(670, 210, 110, 30, "clear");
  int modus = 0;
  mouseInteraction MI = new mouseInteraction(0,0,0,0);
  
  UI() {
    stroke(#FF0000);
    line(400, 300, 450, 300);
    line(400, 300, 400, 350);
  }
  
  void mouseClickChecker() {
    if (mousePressed && (mouseButton == LEFT)) {
      if ((mouseX>=this.button1.x && mouseX<=this.button1.x+this.button1.w) 
        && (mouseY>=this.button1.y && mouseY<=this.button1.y+this.button1.h)) {
        println("clickedButton1");
        modus = 1;
      }
      if ((mouseX>=this.button2.x && mouseX<=this.button2.x+this.button2.w) 
        && (mouseY>=this.button2.y && mouseY<=this.button2.y+this.button2.h)) {
        println("clickedButton2");
        modus = 2;
      }
      if ((mouseX>=this.button3.x && mouseX<=this.button3.x+this.button3.w) 
        && (mouseY>=this.button3.y && mouseY<=this.button3.y+this.button3.h)) {
        println("clickedButton3");
        modus = 3;
      }
      if ((mouseX>=this.button4.x && mouseX<=this.button4.x+this.button4.w) 
        && (mouseY>=this.button4.y && mouseY<=this.button4.y+this.button4.h)) {
        println("clickedButton4");
        modus = 4;
      }
      if ((mouseX>=this.button5.x && mouseX<=this.button5.x+this.button5.w) 
        && (mouseY>=this.button5.y && mouseY<=this.button5.y+this.button5.h)) {
        println("clickedButton5");
        modus = 5;
      }
    } 
  }
  
  void setMouseInput(float clickX, float clickY, float dragX, float dragY) {
    //println(clickX, clickY, dragX, dragY);
    if(this.modus == 1){
      println("hola2");
      cube = new Cube();
      cube.createArrayFromMouseInput(clickX, clickY, dragX, dragY);
      cube.createLineArray();
      cube.display();
    }
  }
    
  class mouseInteraction {
  
    public int x1, y1, x2, y2;
  
    mouseInteraction(int x1, int y1, int x2, int y2) {
      this.x1 = x1;
      this.y1 = y1;
      this.x2 = x2;
      this.y2 = y2;
    }
    
    void actionDistributor(int x1, int y1, int x2, int y2) {
      if (modus == 1) {
        println("There will be a rectangle");
      }
      if (modus == 2) {
        println("There will be a transformation");
      }
      if (modus == 3) {
        println("There will be an Object");
      }
      if (modus == 4) {
        println("There will be a transformation");
      }
    }
  }
  
  class Button {
    
    int x, y, w, h;
    String string;
    
    Button(int x, int y, int w, int h, String string) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
      this.string = string;
      fill(255, 255, 255);
      stroke(#000000);
      rect(x, y, w, h);
      textSize(15);
      fill(0, 102, 153);
      text(string, x+5, y+25);     
    }
  }
  
}
  
