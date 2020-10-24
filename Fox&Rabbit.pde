 //declare bacteria variables here   
 int numFoxes = 10;
 int numRabbits = 100;
 int currentFoxes = 10;
 int currentRabbits = 100;
 
 Fox [] fox = new Fox[1000];
 Rabbit [] rabbit = new Rabbit[1000];
 void setup()   
 {     
   //initialize bacteria variables here  
   size(700, 500);
   background(0);
   for (int i = 0; i < numFoxes; i++)
   {
     fox[i] = new Fox();
   }
   
   for (int i = 0; i < numRabbits; i++)
   {
     rabbit[i] = new Rabbit();
   }
 }   
 
 void draw()   
 {    
   //move and show the bacteria 
   background(0);
   for (int i = 0; i < currentFoxes; i++)
   {
     fox[i].move();
     fox[i].show();
     fox[i].findTarget();
   }
   
   for (int i = 0; i < currentRabbits; i++)
   {
     rabbit[i].move();
     rabbit[i].show();
   }
   
   fill(200, 24, 233);
   rect(550, 30, 50, numFoxes * 2);
   rect(630, 30, 50, numRabbits / 2.5);
   text(numFoxes, 565, 450);
   text(numRabbits, 640, 450);
 }  
 
 void keyPressed()
 {
   if (key == 'q')
   {
     numFoxes += 10;
     if (numFoxes > 200)
     {
       numFoxes = 200;
     }
   }
   else if (key == 'w')
   {
     numFoxes -= 10;
     if (numFoxes < 0)
     {
       numFoxes = 0;
     }
   }
   else if (key == 'e')
   {
     numRabbits += 100;
     if (numRabbits > 1000)
     {
       numRabbits = 1000;
     }
   }
  else if (key == 'r')
   {
     numRabbits -= 100;
     if (numRabbits < 0)
     {
       numRabbits = 0;
     }
   }
 }
 
 void mousePressed()
 {
   //figure out a way to redraw with more or less animals
   background(0);
   for (int i = 0; i < numFoxes; i++)
   {
     fox[i] = new Fox();
   }
   
   for (int i = 0; i < numRabbits; i++)
   {
     rabbit[i] = new Rabbit();
   }
   currentFoxes = numFoxes;
   currentRabbits = numRabbits;
   redraw();
 }
 
 class Fox 
 {     
   int foxX;
   int foxY;
   int foxColor;
   int foxTarget = -1;
   
   boolean isAlive;
   boolean isHungry;
   
   Fox()
   {
     foxX = (int)(Math.random() * 500);
     foxY = (int)(Math.random() * 500);
     foxColor = color(247, 100, 15);
   }
 
  void findTarget()
   {
     for (int i = 0; i < currentRabbits; i++)
     {
       if (foxTarget == -1)
       {
         if (dist(rabbit[i].rabbitX, rabbit[i].rabbitY, foxX, foxY) <= 50 && rabbit[i].isAlive)
         {
           foxTarget = i;
         }
       }
       else 
       {
         if (dist(foxX, foxY, rabbit[foxTarget].rabbitX, rabbit[foxTarget].rabbitY) <= 5)
         {
           rabbit[foxTarget].isAlive = false;
           foxTarget = -1;
         }
       }
     }
   }
   
   void move()
   {
     if (foxTarget == -1)
     {
       foxX += (int)(Math.random() * 7) - 3;
       foxY += (int)(Math.random() * 7) - 3;
     }
     else 
     {
       if (rabbit[foxTarget].rabbitX > foxX)
       {
         foxX += (int)(Math.random() * 7) - 2;
       }
       else
       {
         foxX += (int)(Math.random() * 7) - 4;
       }
       
       if (rabbit[foxTarget].rabbitY > foxY)
       {
         foxY += (int)(Math.random() * 7) - 2;
       }
       else
       {
         foxY += (int)(Math.random() * 7) - 4;
       }
       
     }
     
     if (foxX > 500)
     {
       foxX = 0;
     }
     else if (foxX < 0)
     {
       foxX = 500;
     }
     else if (foxY > 500)
     {
       foxY = 0; 
     }
     else if (foxY < 0)
     {
       foxY = 500; 
     }
   }
   
   void show()
   {
     fill(foxColor);
     ellipse(foxX, foxY, 10, 10);
   }
 }
 
 
 class Rabbit
 {
   int rabbitX;
   int rabbitY;
   int rabbitColor;
   boolean isAlive;
   
   Rabbit()
   {
     rabbitX = (int)(Math.random() * 500);
     rabbitY = (int)(Math.random() * 500);
     isAlive = true;
     rabbitColor = color(99, 55, 4);
   }
   
   void move()
   {
     rabbitX += (int)(Math.random() * 7) - 3;
     rabbitY += (int)(Math.random() * 7) - 3;
     
     if (rabbitX > 500)
     {
       rabbitX = 0;
     }
     else if (rabbitX < 0)
     {
       rabbitX = 500;
     }
     else if (rabbitY > 500)
     {
       rabbitY = 0; 
     }
     else if (rabbitY < 0)
     {
       rabbitY = 500; 
     }
   }
   
   void show()
   {
     if (isAlive)
     {
       fill(rabbitColor);
       ellipse(rabbitX, rabbitY, 10, 10);
     }
   }
 }
