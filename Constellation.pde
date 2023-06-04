class Constellation
{
  int num_stars;
  PVector position_cons;
  PVector velocity_cons;
  
  float mass, damping;
  
  float dock;
  
  boolean is_fixed;
  
  Constellation(int amount, PVector p, PVector v)
  {
    num_stars = amount;
    
    position_cons = p;
    velocity_cons = v;
    
    mass = 1.0;
    dock = 0.3;
    
    damping = 0.4;
    is_fixed = true;
  }
  
  void constellation_fall()
  {
    PVector strength = new PVector(0.0,0.0);
    PVector acceleration = new PVector(0.0,0.0);
    
    float deltaT = 0.04;
    
    strength.x = 0.0;
    strength.y = 0.0;
    
    strength.x += -damping * velocity_cons.x;
    strength.y += -damping * velocity_cons.y;
    
    strength.x += -dock * (velocity_cons.x);
    strength.y += -dock * (velocity_cons.y);
    
    acceleration.x += strength.x / mass;
    acceleration.y += strength.y / mass;
    
    velocity_cons.x += acceleration.x * deltaT;
    velocity_cons.y += acceleration.y * deltaT;
    
    position_cons.x += velocity_cons.x * deltaT;
    position_cons.y += velocity_cons.y * deltaT;
  }
  
  void display_constellation()
  {
    stroke(255);
    strokeWeight(2);
    point(position_cons.x, position_cons.y);
  }
  
}
