

Bird bird1, bird2;
ColorFactory blue_factory = new ColorFactory( 135, 206, 235, 30 );

void setup() {
  size(800, 800);
  bird1 = new Bird( 500, 500, 3, 0.7 * PI, blue_factory.getColor() );
  bird2 = new Bird( 300, 500, 4, 1.3 * PI, blue_factory.getColor() );
}


void draw() {
  background( 255 );
  bird1.fly();
  bird1.draw();
  bird2.fly();
  bird2.draw();  
}
