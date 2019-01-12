class Bird {
  
  /*
   * Bird knows how to:
   * - fly
   * - follow other birds
   * - teleport to the other side when it hits a wall
   *
   * Bird has
   * - position (x,y)
   * - direction
   * - speed
   * 
   * You can change the speed of a bird with setSpeed()
   * and the direction of a bird with setDirection()
   * Both of these result in updates to the internal 
   * direction vector (vector_x and vector_y), which
   * is used to determine the bird's next position.
   * 
   * You can't update the vector directly, only the speed and direction.
   */
   
   private float speed;
   private float x;
   private float y;
   private float theta; // degrees
   private float vector_x;
   private float vector_y;
   private int[] bird_color; // r,g,b
   
   public Bird( float x, float y, float speed, float theta, int[] bird_color ) {
     this.setPosition( x, y );
     this.setDirection( theta );
     this.setSpeed( speed );
     this.setColor( bird_color );
   }
   
  /* ============================================= */
  /* ======= Theser are the setter methods ======= */
  /* ============================================= */
      
   public void setSpeed( float newSpeed ) {
     this.speed = newSpeed;
     this.updateDirectionVector();
   }
   
   public void setPosition( float newX, float newY ) {
     this.x = newX;
     this.y = newY;
   }
   
   public void setDirection( float newTheta ) {
     // Divide out multiples of TWO_PI
     int multiple = floor( newTheta / TWO_PI ); 
     this.theta = newTheta - ( TWO_PI * multiple );
     this.updateDirectionVector();
   }
   
   public void setColor( int[] newColor ) {
     this.bird_color = newColor;
   }
      
  /* ============================================= */
  /* ======= Theser are the getter methods ======= */
  /* ============================================= */
      
   public float getPositionX() {
     return this.x;
   }
   
   public float getPositionY() {
     return this.y;
   }
   
   public float getSpeed() {
     return this.speed;
   }
   
   public float getDirection() {
     return this.theta;
   }
   
  /* ================================================== */
  /* ======= Theser are mover and other methods ======= */
  /* ================================================== */   
   
   /**
    * This method takes the current speed and direction 
    * and sets the direction vector's x and y components accordingly.
    */
   public void updateDirectionVector() {
     this.vector_x = this.speed * cos( this.theta );
     this.vector_y = this.speed * sin( this.theta );
   }

   /**
    * This method moves the bird one frame according
    * to its speed and direction, and it takes care
    * of collisions with walls.
    */
   public void fly() {
      // Move in direction by speed
      this.x = this.x + this.vector_x;
      this.y = this.y + this.vector_y;
      this.teleport_on_wall_collision();
      // println( "x,y = (" + this.x + "," + this.y + "), vector = (" + this.vector_x + "," + this.vector_y + "), size=(" + width + "," + height + ")" );
   }
   
   /**
    * Bounce off a wall by reflection (angle of incidence = angle of reflection),
    */
   public void teleport_on_wall_collision() {
     if ( this.x < 0 ) {
       this.x = width;
     }
     
     if ( this.x > width ) {
       this.x = 0;
     }
     
     if ( this.y < 0 ) {
       this.y = height;
     }
     
     if ( this.y > height ) {
       this.y = 0;
     }
  }
   
   public void draw() {
     fill( this.bird_color[0], this.bird_color[1], this.bird_color[2] );
     ellipse( this.x, this.y, 10, 10);
   }
}
