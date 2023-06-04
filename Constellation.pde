class Constellation
{
  Constellation_Star[] total_stars;


  Constellation(Constellation_Star[] stars_in_constellation)
  {
    for (int i = 0; i < stars_in_constellation.lenght; ++i)
    {
      total_stars[i] = new Constellation_Star;
    }
    
  }
   
  void compute_constellation()
  {

  }
}

class Constellation_Star
{
  PVector position_star;
  PVector velocity_star;
  
  float mass, damping;
  
  float dock;
  
  boolean is_fixed;

  Constellation_Star(PVector p, PVector v)
  {    
    position_cons = p;
    velocity_cons = v;
    
    mass = 1.0;
    dock = 0.3;
    
    damping = 0.4;
    is_fixed = true;

    star_movement();
    display_star();
  }

  void star_movement()
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

  void display_star()
  {
    stroke(255);
    strokeWeight(2);
    point(position_cons.x, position_cons.y);
  }
}
