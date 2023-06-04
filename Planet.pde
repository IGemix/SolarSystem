class Planet {
    float radius;
    float distance;
    float speed;
    float angle;
    float curveAmount;
    float orbitAngle;
    float selfRotation;
  
    ArrayList<Planet> moons;
    ArrayList<PVector> orbitPos;

    PShape globe;

    Planet(float radius, float distance, float speed, float curveAmount, int index) 
    {
        this.radius = radius;
        this.distance = distance;
        this.speed = speed;
        this.curveAmount = curveAmount; 

        this.orbitAngle = 0;
        this.angle = 0;

        moons = new ArrayList();
        orbitPos = new ArrayList();
        
        globe = createShape(SPHERE, radius);
        globe.setTexture(textures[index]);  
        globe.setStroke(false);
    }

    void Update()
    {
        angle += speed;
        
        orbitAngle += 0.2;
        
        DrawMoon();
    }

    void AddMoon(Planet moon) 
    {
        moons.add(moon);
    }

    void DrawMoon()
    {
        for (Planet moon : moons)
        {
            moon.Update();
        }
    }

    void Display() 
    {
        float x = distance * cos(angle);
        float y = distance * sin(angle);
        float z = curveAmount * sin(angle);
        
        pushMatrix();
      
        translate(x, y, z);
        fill(255);
        noStroke();
        shape(globe);

        for (Planet moon : moons)
        {
            moon.Display();
        }
        
        popMatrix();
    }
    
    void ShowOrbit(Planet planet)
    {
        strokeWeight(1);
        stroke(255);
        noFill();
        
        beginShape();
        for(float angle = 0; angle < TWO_PI + 0.1; angle += 0.1)
        {
            float x = planet.distance * cos(angle);
            float y = planet.distance * sin(angle);
            float z = planet.curveAmount * sin(angle);
            vertex(x, y, z);
        }
        endShape(CLOSE);
    }
}
