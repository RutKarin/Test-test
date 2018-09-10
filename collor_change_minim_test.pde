import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
PImage img;
 
Minim minim;
AudioInput in;
 
void setup()
{
  size( 540, 687 );
  img = loadImage("fig.jpg");
 
}
 
{   
  minim = new Minim( this );
  in = minim.getLineIn( Minim.STEREO, 512 );
}
 
void draw()
{
   image(img, 0, 0);
  float p = 0;
  for ( int i = 0; i < in.bufferSize(); i++ ) {
    p += abs( in.mix.get( i ) ) * 1;
  }
  loadPixels();
 
  for (int i=0; i<(width*height); i++) {
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
 
    pixels[i] = color(r*p, g/p, b+p);
  }
  updatePixels();
}
 
void stop()
{
  in.close();
  minim.stop();
  super.stop();
}
