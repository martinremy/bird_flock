/**
 * A ColorFactory is an object that starts with a single RGB color
 * and a range over which the values (R, G, and B) are allowed to change,
 * and then generates variations of that initial color on demand.
 */
class ColorFactory {

  int seed_r = 0;
  int seed_g = 0;
  int seed_b = 0;

  int r = 0;
  int g = 0;
  int b = 0;

  int range = 10;

  ColorFactory( int r, int g, int b, int range ) {
    this.r = this.seed_r = r;
    this.g = this.seed_g = g;
    this.b = this.seed_b = b;
    this.range = range;
  }

  int[] getColor() {
    // perturb the color by range
    this.r = this.r + Math.round( random( -1, 1 ) );
    this.g = this.g + Math.round( random( -1, 1 ) );
    this.b = this.b + Math.round( random( -1, 1 ) );


    if ( this.r < 0 ) this.r = 0;
    if ( this.g < 0 ) this.g = 0;
    if ( this.b < 0 ) this.b = 0;

    if ( this.r > 255 ) this.r = 255;
    if ( this.g > 255 ) this.g = 255;
    if ( this.b > 255 ) this.b = 255;

    if ( this.r < this.seed_r - range ) this.r = this.seed_r - range;
    if ( this.g < this.seed_g - range ) this.g = this.seed_g - range;
    if ( this.b < this.seed_b - range ) this.b = this.seed_b - range;

    if ( this.r > this.seed_r + range ) this.r = this.seed_r + range;
    if ( this.g > this.seed_g + range ) this.g = this.seed_g + range;
    if ( this.b > this.seed_b + range ) this.b = this.seed_b + range;

     int[] col = new int[3];
     col[0] = this.r;
     col[1] = this.g;
     col[2] = this.b;

     return col;
  }
}
