Particle[] particles = new Particle[1000];
boolean saving = false;

void setup() {
  size(1100, 800);
  smooth();
  
  // create particles
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle(new PVector(100, height-100));
  }
}

void draw() {
  background(255);
  // draw the particles
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].draw();
  }
}


class Particle {
  PVector loc;
  PVector vel;
  PVector acc;

  PVector[] h;
  int counter = 0;
  
  // create the particle
  Particle(PVector l) {
    float randmin = -1.5;
    float randmax = 0;
    
    float r = random(0, 6);
    float x = cos(r);
    float y = sin(r);
    acc = new PVector(x / 250, y / 250);

    float q = random(0, 1);
    r = random(randmin, randmax);
    x = cos(r) * q;
    y = sin(r) * q;
    vel = new PVector(x, y);
    loc = l.get();    
    h = new PVector[1000];
  }

  // update location
  void update() {
    vel.add(acc);
    loc.add(vel);
    // save location every 10 frames
    if (frameCount % 10 == 0 && counter < h.length) {
      h[counter] = loc.get();
      counter++;
    }
  }

  // draw particle
  void draw() {
    fill(100,50);
    
    noFill();
    stroke(0, 100);
    beginShape();
    for (int i=0; i < counter; i++) {
      vertex(h[i].x,h[i].y);
    }
    if (counter > 0) vertex(loc.x, loc.y);
    endShape();
  }
  
}
