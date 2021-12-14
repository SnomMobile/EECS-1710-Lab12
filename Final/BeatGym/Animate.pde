class Animate
{
  PImage img1;
  PImage img2;
  int counter = 1;
  
  Animate(PImage first, PImage second)
  {
    img1 = first;
    image(img1,200,150);
    img2 = second;
  }
  PImage swap()
  {
    PImage returner = img1;
    if(counter == 1)
    {
      counter = 2;
      returner = img1;
    }
    else
    {
      counter = 1;
      returner = img2;
    }
    return returner;
  }
}
