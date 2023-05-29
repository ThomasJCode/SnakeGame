
//Characteristics of the Snake's food
class Food {
  int x, y, w, h;
  color c;
  Food (int _x, int _y, int _w, int _h, color _c) {
    x = _x; //X position
    y = _y; //Y position
    w = _w; //Width
    h = _h; //Height
    c = _c; //Color
  }
  void show(int vx, int vy){  // X velocity and Y velocity
    x += vx * w; //X receives the X velocity times the size of the object (length)
    y += vy * h; //Y receives the Y velocity times the size of the object (height)
    fill(c); //Color the object according to the variable C
    stroke(#9B0000); //Border color of the food
    strokeWeight(2); //Border thickness
    rect(x, y, w, h); //Create a rectangle, where 15 refers to the rounding
    fill(#197600); //Color of the 'leaf' of the food
    stroke(#197700); //Border color of the leaf
    strokeWeight(2); //Border thickness
    rect(x+10, y, 8, 20); //The leaf itself, position x, y, and siz
  }
}

//Function to create the Snake's food
void newFood() {
  
  boolean f = false;
  while (!f) {
    f = true;
    food.x = int(random(width/szSn)) * szSn; //Calculate where the food will appear randomly
    food.y = int(random(height/szSn)) * szSn;
    for (int i = 0; i < tam; i++) { //Check if the food does not appear on top of the Snake
      if (food.x == sn[i].x && food.y == sn[i].y)
        f = false;
    }
  }
}
