class Constellation
{
  PVector initial_position;
  ArrayList<Constellation_Star> total_stars = new ArrayList();
  
  Constellation(PVector init_pos, int num_of_stars)
  {
    PVector initial_position = init_pos;
    for (int i = 0; i < num_of_stars; ++i)
    {
      if(i < 1)
      {
        total_stars.add(new Constellation_Star(initial_position, new PVector(0.0,0.0))); 
      }
      else
      {
        total_stars.add(new Constellation_Star(new PVector(random(total_stars.get(i-1).position_star.x - 1.5, total_stars.get(i-1).position_star.x + 1.5), random(init_pos.y, init_pos.y + 1.5) ), new PVector(0.0,0.0)));
      }
    }
    
  }
   
  void compute_constellation()
  {
    for (int i = 0; i < total_stars.size(); ++i)
    {
      total_stars.get(i).star_movement();
      total_stars.get(i).display_star(); 
    }
    
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
    // print("Pos Star: ", position_star.x);
  }
}
