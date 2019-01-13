public static int[] getColor() {
  int[] c = new int[3];
  c[0] = (int)Math.round( Math.random() * 255.0 ); 
  c[1] = (int)Math.round( Math.random() * 255.0 ); 
  c[2] = (int)Math.round( Math.random() * 255.0 );
  return c;
}    
