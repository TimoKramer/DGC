class UI {
    
  UI() {
    
    Button button1 = new Button(750, -370, 200, 55, 7, "Cube");

  }
  
  class Button {
    
    Button(int x, int y, int w, int h, int r, String string) {
      
      rect(x, y, w, h, r);
      textSize(40);
      fill(0, 102, 153);
      text(string, x+5, y+42);
      
    }
  }
}
  
