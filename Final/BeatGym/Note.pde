class Note
{
  int x;
  int y;
  int sizex;
  int sizey;
  Boolean clicked = false;
  
  Note(int vertx, int verty, int wide, int high)
  {
    x = vertx;
    y = verty;
    sizex = wide;
    sizey = high;
  }
  Boolean check(int xMouse, int yMouse)
  {
    if(xMouse>x && xMouse<x+sizex & yMouse>y && yMouse<y+sizey)
    {
      if(clicked == false)
      {
        fill(0,255,0);
        rect(x,y,sizex,sizey);
        clicked = true;
      }
      else
      {
        fill(255,0,0);
        rect(x,y,sizex,sizey);
        clicked = false;
      }
    }
    return clicked;
  }
  void reload()
  {
    if(clicked == false)
    {
      fill(255,0,0);
      rect(x,y,sizex,sizey);
    }
    if(clicked == true)
    {
      fill(0,255,0);
      rect(x,y,sizex,sizey);
    }
  }
}
