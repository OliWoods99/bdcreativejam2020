import gifAnimation.*;
float pos = 0;
float[][] data = {{0,194,241,0.05},{0,396,475,29.27},{93,1047,753,0.32},{90,1885,2110,8.77},{0,1910,2015,0.32},{0,2390,2158,8.87},{0,6008,6146,0.07},{417,17214,12558,1.39},{465,41196,10452,0.03}};
boolean showText = false;
PImage logo;
PImage bg;
boolean quakeTrig = false;

class Icon{
  float x;
  float y;
  float size;
  float circ;
  PImage img;
  int defaultSize = 80;
  float[] iconData;
  
  void drawIcon(Boolean big){ 
    if(big){
      image(img, x + pos, y - (circ/2),circ ,circ);
    }
    else{
      image(img, (x + pos), y - (defaultSize/2),defaultSize ,defaultSize);
    }
  }
  
  void showData(Boolean show){
    //rect(x,y,width,height);
    //offset to align rects nicely
    float offset = - 4;
    
    if(show){
      
      float length = 100;
      stroke(140,64,156); 
      fill(140,64,156);
      
      //text
      if(showText){
        textSize(16);
        textFont( createFont("Arial Bold", 18));
        text(makeString(), ((x + pos) - 40) + offset, (y - circ) - 90);
      }
      
      //q1 + q3
      float q1 = iconData[0]/100;
      float q3 = iconData[2]/100;
     
      rect(((x + pos) ) + offset, y + 25, 5, q1 + 10);
      rect(((x + pos) + 10) + offset, y + 25, 5, q3 + 10);
      
      //risk (%) 
      stroke(255,0,0); 
      fill(255,0,0);
      rect(((x + pos) - 10) + offset, y + 25, 5, iconData[3] + 10);

    }
    else{
      stroke(255);
      noFill();
    }
  } 
  
  String makeString(){
    String dataString = "";
    
    String mean = Float.toString(iconData[1]);
    String q1 = Float.toString(iconData[0]);
    String q3 = Float.toString(iconData[2]);
    String risk = Float.toString(iconData[3]);
    
    dataString="Mean: £" + mean + "\nQ1: £" + q1 +"\nQ3: £"+q3 +"\nRisk: " + risk +"%";
    return dataString;
  }
}

Icon animal;      //1 - mean cost low to high -
Icon accident;    //2
Icon lightning;   //3
Icon theft;       //4
Icon tree;        //5
Icon escapedWater;//6
Icon smoke;       //7
Icon fire;        //8
Icon explosion;   //9

Icon equake;

Car car;
Gif pugAnimationLeft;
Gif pugAnimationRight;
Gif earthquakeAnimation;

ArrayList<Car> cars = new ArrayList<Car>();

void settings() {
  size(3*displayWidth>>2, 3*displayHeight>>2);
}

void setup()
{
  
 surface.setTitle("Ageas Insurance Claims");
 
 pugAnimationLeft = new Gif(this, "pugcarleft.gif");
 pugAnimationLeft.play();
 
 pugAnimationRight = new Gif(this, "pugcar.gif");
 pugAnimationRight.play();
 
 earthquakeAnimation = new Gif(this, "earthquake.gif");

 logo = loadImage("logo2.png");
 bg = loadImage("background.png");
 bg.resize(width,height);

 animal = new Icon();
 accident = new Icon();
 lightning = new Icon();
 theft = new Icon();
 tree = new Icon();
 escapedWater = new Icon();
 smoke = new Icon();
 fire = new Icon();
 explosion = new Icon();
 
 equake = new Icon();
 
 equake.x = width * 0.01;
 equake.y = height * 0.75;
 equake.circ = 85;
 equake.img = earthquakeAnimation;

 animal.x = width * 0.1;
 animal.y = height * 0.75;
 animal.circ = 85;
 animal.img = loadImage("animal.png");
 animal.iconData = data[0];

 accident.x = width * 0.2;
 accident.y = height * 0.75;
 accident.circ = 106.6;
 accident.img = loadImage("accident.png");
 accident.iconData = data[1];
 
 lightning.x = width * 0.3;
 lightning.y = height * 0.75;
 lightning.circ = 140;
 lightning.img = loadImage("lightning.png");
 lightning.iconData = data[2];
 
 theft.x = width * 0.4;
 theft.y = height * 0.75;
 theft.circ = 170.4;
 theft.img = loadImage("theft.png");
 theft.iconData = data[3];
 
 tree.x = width * 0.5;
 tree.y = height * 0.75;
 tree.circ = 176.2;
 tree.img = loadImage("fallentree.png");
 tree.iconData = data[4];
 
 escapedWater.x = width * 0.6;
 escapedWater.y = height * 0.75;
 escapedWater.circ = 184.8;
 escapedWater.img = loadImage("escapedwater.png");
 escapedWater.iconData = data[5];
 
 smoke.x = width * 0.7;
 smoke.y = height * 0.75;
 smoke.circ = 255.4;
 smoke.img = loadImage("smoke.png");
 smoke.iconData = data[6];
 
 fire.x = width * 0.8;
 fire.y = height * 0.75;
 fire.circ = 361.8;
 fire.img = loadImage("housefire.png");
 fire.iconData = data[7];
 
 explosion.x = width * 0.9;
 explosion.y = height * 0.75;
 explosion.circ = 481.8;
 explosion.img = loadImage("explosion.png");
 explosion.iconData = data[8];
}

void draw()
{
  background(bg);
  
  stroke(140,64,156); 
  strokeWeight(4);
  
  imageMode(CORNER);
  image(logo,0,0);
  
  imageMode(CENTER);
  
  line(0, (height * 0.75), width,  (height * 0.75));
  line(0, (height * 0.77), width,  (height * 0.77));
  
  equake.drawIcon(false);
  
  animal.drawIcon(false);
  animal.showData(false);
  
  accident.drawIcon(false);
  accident.showData(false);
  
  lightning.drawIcon(false);
  lightning.showData(false);
  
  theft.drawIcon(false);
  theft.showData(false);
  
  tree.drawIcon(false);
  tree.showData(false);
  
  escapedWater.drawIcon(false);
  escapedWater.showData(false);
  
  smoke.drawIcon(false);
  smoke.showData(false);
  
  fire.drawIcon(false);
  fire.showData(false);
  
  explosion.drawIcon(false);
  explosion.showData(false);
  
  
  if ((mouseX > ((animal.x + pos) - animal.defaultSize) && (mouseX < (animal.x + pos) + animal.defaultSize)) && ((mouseY > animal.y - animal.defaultSize) && (mouseY < animal.y + animal.defaultSize))){
    animal.drawIcon(true);
    animal.showData(true);
  }
  else if ((mouseX > ((accident.x + pos) - accident.defaultSize) && (mouseX < (accident.x + pos) + accident.defaultSize)) && ((mouseY > accident.y - accident.defaultSize) && (mouseY < accident.y + accident.defaultSize))){
    accident.drawIcon(true);
    accident.showData(true);
  }
  else if((mouseX > ((tree.x + pos) - tree.defaultSize) && (mouseX < (tree.x + pos) + tree.defaultSize)) && ((mouseY > tree.y - tree.defaultSize) && (mouseY < tree.y + tree.defaultSize))){
    tree.drawIcon(true);
    tree.showData(true);
  }
  else if((mouseX > ((lightning.x + pos) - lightning.defaultSize) && (mouseX < (lightning.x + pos) + lightning.defaultSize)) && ((mouseY > lightning.y - lightning.defaultSize) && (mouseY < lightning.y + lightning.defaultSize))){
    lightning.drawIcon(true);
    lightning.showData(true);
  }
  else if((mouseX > ((theft.x + pos) - theft.defaultSize) && (mouseX < (theft.x + pos) + theft.defaultSize)) && ((mouseY > theft.y - theft.defaultSize) && (mouseY < theft.y + theft.defaultSize))){
    theft.drawIcon(true);
    theft.showData(true);
  }
  else if((mouseX > ((escapedWater.x + pos) - escapedWater.defaultSize) && (mouseX < (escapedWater.x + pos) + escapedWater.defaultSize)) && ((mouseY > escapedWater.y - escapedWater.defaultSize) && (mouseY < escapedWater.y + escapedWater.defaultSize))){
    escapedWater.drawIcon(true);
    escapedWater.showData(true);
  }
  if ((mouseX > ((smoke.x + pos) - smoke.defaultSize) && (mouseX < (smoke.x + pos) + smoke.defaultSize)) && ((mouseY > smoke.y - smoke.defaultSize) && (mouseY < smoke.y + smoke.defaultSize))){
    smoke.drawIcon(true);
    smoke.showData(true);
  }
  else if ((mouseX > ((fire.x + pos) - fire.defaultSize) && (mouseX < (fire.x + pos) + fire.defaultSize)) && ((mouseY > fire.y - fire.defaultSize) && (mouseY < fire.y + fire.defaultSize))){
    fire.drawIcon(true);
    fire.showData(true);
  }
  else if ((mouseX > ((explosion.x + pos) - explosion.defaultSize) && (mouseX < (explosion.x + pos) + explosion.defaultSize)) && ((mouseY > explosion.y - explosion.defaultSize) && (mouseY < explosion.y + explosion.defaultSize))){
    explosion.drawIcon(true);
    explosion.showData(true);
  }
  else if ((mouseX > ((equake.x + pos) - equake.defaultSize) && (mouseX < (equake.x + pos) + equake.defaultSize)) && ((mouseY > equake.y - equake.defaultSize) && (mouseY < equake.y + equake.defaultSize))){
    equake.drawIcon(true);
    if(!quakeTrig){
       earthquakeAnimation.play();
       quakeTrig = true;
    }
  }
  
  int x = int(random(500));
  if(x == 42){
    car = new Car();
    car.spawn();
    cars.add(car);
  }
  for(Car car : cars){
    car.drawCar();
    
    if(car.x > width){
      car = null;
    }
    else if(car.x < -width){
      car = null;
    }
  }
}

//  control bits

void mouseDragged(){
  float dx = mouseX - pmouseX;
  pos = pos + dx;
  
  if(pos > width + (width * 0.25)){
    pos = width + (width * 0.25);
  }
  else if(pos < -(width + (width * 0.25))){
    pos = -(width + (width * 0.25));
  }
}
void mouseClicked() {
  if (showText) {
    showText = false;
  } 
  else {
    showText = true;
  }
}

//bonus challanges + visuals

class Car{
  float x;
  float y = height * 0.76;
  float speed;
  PImage skin;
  boolean left;
  boolean pug;
  
  void spawn(){
    int randx = int(random(2));
    
    if(randx == 1){
      left = true;
      x = (width + width);
      speed = - 5;
    }
    
    else{
      left = false;
      x = - (width + width);
      speed = 5;
    }
    
    int randSkin = int(random(3));
   
    if(randSkin == 1){
      pug = true;
    }
    
    else{
      pug = false;
    }
  }
 
  void drawCar(){
    if(left){
      if(pug){
        skin = pugAnimationLeft;;
      }
      else{
        skin = loadImage("carleft.png");
      }
    }
    else{
      if(pug){
        skin = pugAnimationRight;;
      }
      else{
        skin = loadImage("car.png");
      }
    }
    x = x + speed;
    //skin.resize(50,50);
    image(skin,x + pos,y - 20,50,50);
  }
}
