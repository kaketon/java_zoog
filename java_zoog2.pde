abstract class Zoog{ //抽象クラス
  int x,y,dx,dy;
  boolean rightEye=true;
  boolean leftEye=true;
  
  Zoog(int x0,int y0,int dx0,int dy0){
    x=x0;
    y=y0;
    dx=dx0;
    dy=dy0;
  }

  void display(){
    stroke(0);
    //Draw Zoog's body
    fill(150);
    rect(x,y,20,100);
    //Draw Zoog's head
    fill(255);
    ellipse(x,y-30,60,60);
    //Draw Zoog's eyes
    fill(0);
    if(rightEye){
      ellipse(x-19,y-30,16,32);
    }
    if(leftEye){
      ellipse(x+19,y-30,16,32);
    }
    //Draw Zoog's arm
    line(x-10,y+10,x-50,y-10);
    line(x+10,y+10,x+50,y-10);
    //Draw Zoog's legs
    line(x-10,y+50,x-20,y+60);
    line(x+10,y+50,x+20,y+60);
  }
  
  void judge(){
    if(dist(mouseX,mouseY,x-19,y-30)<16){
      rightEye=false;
    }
    if(dist(mouseX,mouseY,x+19,y-30)<16){
      leftEye=false;
    }
  }
  abstract void move(); //抽象メソッド
  abstract void changecolor(); //抽象メソッド
}

class OriginZoog extends Zoog{ //横に動くZoog
  OriginZoog(int x0,int y0,int dx0,int dy0){
    super(x0,y0,dx0,dy0);
  }
  void move(){
    if(rightEye || leftEye){
      x+=dx;
    }
    if(x+30>width || x-30<0){
      dx*=-1;
    }
  }
  void changecolor(){ //横に動くZoogの色を変える
    if(rightEye==false && leftEye==false){
       fill(255,0,255); //紫色に塗る
       ellipse(x,y-30,60,60);
    }
  }
}

class VerticalZoog extends Zoog{ //縦に動くZoog
  VerticalZoog(int x0,int y0,int dx0,int dy0){
    super(x0,y0,dx0,dy0);
  }
  void move(){
    if(rightEye || leftEye){
      y+=dy;
    }
    if(y+30>width || y-30<0){
      dy*=-1;
    }
  }
  void changecolor(){ //縦に動くZoogの色を変える
    if(rightEye==false && leftEye==false){
       fill(255,0,0); //赤色に塗る
       ellipse(x,y-30,60,60);
    }
  }
}
  
Zoog z[];

void setup(){
  // sizeをセット
  size(400, 400);
  // 円と四角形のCENTER Modeをセット
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  z=new Zoog[2];
  z[0]=new VerticalZoog(100,200,4,4);
  z[1] = new OriginZoog(100, 300, 5,4);
}

void draw(){
  // Draw a white background
  background(255);
  for(int i = 0; i < z.length; i++){
    z[i].display();
    z[i].move();
    z[i].changecolor();
  }
}

//目がクリックされたか否かの判定
void mouseClicked(){
  for(int i = 0; i < z.length; i++){
    z[i].judge();
  }
}
