class Button {
  PVector pos;
  color textColor, hoverColor;
  float size, tWidth;
  String text;
  PFont fButton;
  
 
 
  Button(String text, PVector pos, float size, color textColor, color hoverColor) {
    this.pos = pos;  //Button position
    this.textColor = textColor;  //Button color
    this.hoverColor = hoverColor; //Button hover color
    this.size = size;  //Text size
    this.text = text;  //The text itself
    textSize(size);
    tWidth = textWidth(text);
  }

  void draw(boolean on) {
    textSize(size);

    if (containsMouse()) fill(hoverColor);  //If the mouse hovers over, fill with color
    else fill(textColor);                                 //defined in the 'hovercolor' variable
    text(text, pos.x, pos.y + size);
    if (on)
      rect(pos.x, pos.y, tWidth, size);
  }

  boolean containsMouse() {
    if (mouseX > pos.x && mouseX < pos.x + 1.8*tWidth && mouseY > pos.y && mouseY < pos.y + size )
      return true;
    else return false;
    
  }
}
