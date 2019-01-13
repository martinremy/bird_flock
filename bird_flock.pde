

ArrayList<Bird> birds;
int num_birds = 10;

void setup() {
  size(800, 800);
  birds = new ArrayList<Bird>();
  for ( int i = 0; i < num_birds; i++ ) {
    float bird_x = (float)Math.random() * width;
    float bird_y = (float)Math.random() * height;
    float bird_speed = (float)Math.random();
    float bird_direction = (float)Math.random() * TWO_PI;
    int[] bird_color = getColor();
    
    Bird b = new Bird( bird_x, bird_y, bird_speed, bird_direction, bird_color );
    birds.add( b );
  }
}

void draw() {
  background( 255 );
  for ( int i = 0; i < num_birds; i++ ) {
    Bird bird = birds.get( i );
    bird.fly();
    bird.draw();
  }
}
