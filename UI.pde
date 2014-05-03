class UI {
  Button button1 = new Button(670, 10, 110, 30, "createCube");
  Button button2 = new Button(670, 60, 110, 30, "transfCube");
  Button button3 = new Button(670, 110, 110, 30, "createObject");
  Button button4 = new Button(670, 160, 110, 30, "transfObject");
  Button button5 = new Button(670, 210, 110, 30, "clear");
  
  UI() {
    stroke(#FF0000);
    line(0, 0, 100, 0);
    line(0, 0, 0, 100);
  }
  
  void mouseClickChecker() {
    if (mousePressed && (mouseButton == LEFT)) {
      if ((mouseX>=this.button1.x && mouseX<=this.button1.x+this.button1.w) 
        && (mouseY>=this.button1.y && mouseY<=this.button1.y+this.button1.h)) {
        println("clickedButton1");
      }
      if ((mouseX>=this.button2.x && mouseX<=this.button2.x+this.button2.w) 
        && (mouseY>=this.button2.y && mouseY<=this.button2.y+this.button2.h)) {
        println("clickedButton2");
      }
      if ((mouseX>=this.button3.x && mouseX<=this.button3.x+this.button3.w) 
        && (mouseY>=this.button3.y && mouseY<=this.button3.y+this.button3.h)) {
        println("clickedButton3");
      }
      if ((mouseX>=this.button4.x && mouseX<=this.button4.x+this.button4.w) 
        && (mouseY>=this.button4.y && mouseY<=this.button4.y+this.button4.h)) {
        println("clickedButton4");
      }
      if ((mouseX>=this.button5.x && mouseX<=this.button5.x+this.button5.w) 
        && (mouseY>=this.button5.y && mouseY<=this.button5.y+this.button5.h)) {
        println("clickedButton5");
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
  
