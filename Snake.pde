class Snake {
  int x, y, w, h;
  boolean head = false;
  color c;

  Snake (int _x, int _y, int _w, int _h, color _c) {
    x = _x; //X position
    y = _y; //Y position
    w = _w; //Width
    h = _h; //Height
    c = _c; //Color
  }

  void show(int vx, int vy) {  // X velocity and Y velocity

    x += vx * h; //x receives the x velocity times the size of the object (length)
    y += vy * w; //y receives the y velocity times the size of the object (height)

    fill(c); //Color the object according to the variable C
    stroke(SnakeStrokeColorDefault); //Border color
    strokeWeight(3); //Border thickness
    rect(x, y, w, h); //Create a rectangle, where 15 refers to the rounding

    if (head == true) {
      fill(0); //Snake's eye color
      noStroke(); //remove borders
      rect(x+25, y+25, 7, 7); //x,y position and eye size
      rect(x+25, y+10, 7, 7); //x,y position and eye size
    } else {
      return;
    }
  }
}


//Function to increase Snake every time he eats more food
void piece() {  //Every time "piece" is called, the snake will increase
  tam++;
  sEat.play();
  sEat.rewind();
  color c = SnakeColorDefault; //Snake color
  int[][] xy = new int [2][tam]; //Array to store previous positions

  for (int i = 0; i < tam-1; i++) {
    if (tam > tInit+1) { //Check if the size is bigger than the initial size
      xy[0][i] = sn[i].x;
      xy[1][i] = sn[i].y;
    } else {
      xy[0][i] = szSn * 5;
      xy[1][i] = szSn * 2;
    }
  }

  sn = new Snake[tam]; //Object declaration with initial size "size"
  for (int i = 0; i < tam; i++) {  //Lasso to increase Snake parts
    sn[i] = new Snake(xy[0][i], xy[1][i], szSn, szSn, c);
  }

  sn[0].c = SnakeColorDefault; //Paint the leader a different color
  sn[0].head = true;
  newFood(); //To generate food with each new piece as well
}
