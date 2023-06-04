class Constellation
{
  PVector initial_position;
  Constellation_Star[] total_stars;
  
  Constellation(PVector init_pos, Constellation_Star[] stars_in_constellation)
  {
    PVector initial_position = init_pos;
    for (int i = 0; i < stars_in_constellation.length; ++i)
    {
      if(i < 1)
      {
        total_stars[i] = new Constellation_Star(init_pos, new PVector(0.0,0.0));
      }
      else
      {
        total_stars[i] = new Constellation_Star(new PVector(random(total_stars[i-1].position_star.x - 1.5, total_stars[i-1].position_star.x + 1.5), random(init_pos.y, init_pos.y + 1.5) ), new PVector(0.0,0.0));
      }
    }
    
  }
   
  void compute_constellation()
  {
    /*for (int i = 0; i < total_stars.length; ++i)
    {
      
    }
    */
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
    position_star = p;
    velocity_star = v;
    
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
    
    strength.x += -damping * velocity_star.x;
    strength.y += -damping * velocity_star.y;
    
    strength.x += -dock * (velocity_star.x);
    strength.y += -dock * (velocity_star.y);
    
    acceleration.x += strength.x / mass;
    acceleration.y += strength.y / mass;
    
    velocity_star.x += acceleration.x * deltaT;
    velocity_star.y += acceleration.y * deltaT;
    
    velocity_star.x += velocity_star.x * deltaT;
    velocity_star.y += velocity_star.y * deltaT;
  }

  void display_star()
  {
    stroke(255);
    strokeWeight(2);
    point(position_star.x, position_star.y);
  }
}
