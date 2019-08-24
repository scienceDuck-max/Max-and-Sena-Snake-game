//max_sena love snake
import ddf.minim.*;
Minim minim;

AudioSample itemSound;
AudioPlayer bgSound;
AudioPlayer gameoverSound;

int headPosX = 200;
int headPosY = 200;
int[] snakePosX = new int [100];
int[] snakePosY = new int [100];
int snakeLength = 3;

int direction = 0;
int itemPosX = 0;
int itemPosY = 0;

int DIR_LEFT = 0;
int DIR_RIGHT = 1;
int DIR_UP = 2;
int DIR_DOWN = 3;

PImage head;
PImage body;
PImage bg;
PImage item;
PImage gameover;

boolean bGameover = false;

void setup()
{
  size(600, 600);
  imageMode(CENTER);
  rectMode(CENTER);

  minim = new Minim(this);
  itemSound = minim.loadSample( "itemSound.wav", 512);
  bgSound = minim.loadFile("bgSound.mp3");
  bgSound = minim.loadFile("bgSound.mp3");
  bgSound.loop();
  gameoverSound = minim.loadFile("gameover.wav");

  head = loadImage("head.jpg");
  body = loadImage("snakebody.jpg");
  bg= loadImage("background.png");
  item = loadImage("ball.png");
  gameover = loadImage("go.png");

  itemPosX = (int)random(width*0.2, width*0.8);
  itemPosY = (int)random(height*0.2, height*0.8);

  for (int i=0; i<100; i++)
  {
    snakePosX[i] = -999;
    snakePosY[i] = -999;
  }

  frameRate(10);
}

void draw()
{
  //checkgameover : snake hits the wall
  if (headPosX<0 || headPosX > width || headPosY <0 || headPosY > height)
  {
    image(gameover, width/2, height/2, 400, 400);
    bgSound.pause();
    if(bGameover==false)
    {
      gameoverSound.play(0);
      bGameover=true;
    }
  } 
  else 
  {
    //background(240, 161, 141);
    image(bg, width/2, height/2, width, height);
    int speed = 40;


    //Position update
    if (direction==DIR_UP)//Up
    {
      headPosY=headPosY-speed;
    } else if (direction==DIR_LEFT)//Left
    {
      headPosX=headPosX-speed;
    } else if (direction==DIR_DOWN)//Down
    {
      headPosY=headPosY+speed;
    } else if (direction==DIR_RIGHT)//Right
    {
      headPosX=headPosX+speed;
    }

    //Check Item position
    float distance = dist(headPosX, headPosY, itemPosX, itemPosY);
    if ( distance < 30 )
    {
      itemPosX = (int)random(width*0.2, width*0.8);
      itemPosY = (int)random(height*0.2, height*0.8);

      itemSound.trigger();
      snakeLength++;
    }
    //Draw snake and apple
    image(item, itemPosX, itemPosY, 40, 40); 

    //update snakeLength
    for (int i=snakeLength; i>0; i--)
    {
      snakePosX[i] = snakePosX[i-1];
      snakePosY[i] = snakePosY[i-1];
    }
    snakePosX[0]=headPosX;
    snakePosY[0]=headPosY;

    //draw snake
    for (int i=0; i<snakeLength; i++)
    {
      if (i==0)
      {
        image(head, snakePosX[i], snakePosY[i], 40, 40); //head image\
      } else
      {
        image(body, snakePosX[i], snakePosY[i], 40, 40); //body image
      }
    }
  }
}

void keyPressed()
{
  if (key=='w')//Up
  {
    direction=DIR_UP;
  } else if (key=='a')//Left
  {
    direction=DIR_LEFT;
  } else if (key=='s')//Down
  {
    direction=DIR_DOWN;
  } else if (key=='d')//Right
  {
    direction=DIR_RIGHT;
  } else if (key==' ')
  {
    reset();
  }
}

void reset()
{
  headPosX=width/2;
  headPosY=height/2;

  for (int i=0; i<100; i++) 
  {
    snakePosX[i] = -999;
    snakePosY[i] = -999;
  }
  snakeLength = 3;
  
  bgSound.loop();
  gameoverSound.pause();
  
   bGameover=false;
}
