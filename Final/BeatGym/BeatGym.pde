import processing.sound.*;
int timer = 0;
int counter = 0;
int screen = 0;

SoundFile bass;
SoundFile highHat;

Note [] bassArr;
Boolean [] bassBool;
Animate bassAnim;

Note [] highArr;
Boolean [] highBool;
Animate highAnim;

PImage drawer;

void setup()
{
  PImage photo1 = loadImage("bass1.jpg");
  PImage photo2 = loadImage("bass2.jpg");
  PImage photo3 = loadImage("high1.jpg");
  PImage photo4 = loadImage("high2.jpg");
  
  size(500,500);
  background(255);
  
  bass = new SoundFile(this, "house-kick-a-sharp-key-615-37g.wav");
  highHat = new SoundFile(this, "old-school-thin-hip-hop-closed-high-hat-sound-d-key-87-lEJ.wav");
  
  bassArr = new Note [4];
 
  for(int i = 0;i<bassArr.length;i++)
  {
    bassArr[i] = new Note(50*(i),400,50,100);
  }
  bassBool = new Boolean [4];
  for(int i = 0;i<bassBool.length;i++)
  {
    bassBool[i] = false;
  }
  bassAnim = new Animate(photo1,photo2);
  //-------------------------------------------
  //-------------------------------------------
  highArr = new Note [4];
  
  for(int i = 0;i<highArr.length;i++)
  {
    highArr[i] = new Note(50*(i),400,50,100);
  }
  highBool = new Boolean [4];
  for(int i = 0;i<highBool.length;i++)
  {
    highBool[i] = false;
  }
  highAnim = new Animate(photo3,photo4);
  
  
  for(int i = 0;i<bassArr.length;i++)
  {
    bassArr[i].reload();
  }
  drawer = photo1; 
  image(drawer,200,150);
}
void draw()
{
  metro();
}
void mouseClicked()
{
  if(screen == 0)
  {
     for(int i = 0;i<bassArr.length;i++)
     {
       bassBool[i] = bassArr[i].check(mouseX,mouseY);
     }
  }
  if(screen == 1)
  {
     for(int i = 0;i<highArr.length;i++)
     {
       highBool[i] = highArr[i].check(mouseX,mouseY);
     }
  }
}
void metro()
{
  timer++;
  println(timer);
  if(timer>=60)
  {
    timer = 0;
  }
  if(timer%15 == 0)
  {
    if(bassBool[counter] == true)
    {
      bass.play();
      if(screen == 0)
      {
        drawer = bassAnim.swap();
        image(drawer,200,150);
      }
    }
    if(highBool[counter] == true)
    {
      highHat.play();
      if(screen == 1)
      {
        drawer = highAnim.swap();
        image(drawer,200,150);
      }
    }
    counter++;
    if(counter == 4)
    {
      counter = 0;
    }
  }
}
void keyPressed()
{
  if(key=='1')
  {
    screen = 0;
    for(int i = 0;i<bassArr.length;i++)
    {
      bassArr[i].reload();
    }
    drawer = bassAnim.swap();
    image(drawer,200,150);
  }
  if(key=='2')
  {
    screen = 1;
    for(int i = 0;i<highArr.length;i++)
    {
      highArr[i].reload();
      drawer = highAnim.swap();
      image(drawer,200,150);
    }
  }
}
