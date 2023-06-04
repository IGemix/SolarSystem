class Planet {
    float radius;
    float distance;
    float speed;
    float angle;
    float curveAmount;
    float orbitAngle;

    ArrayList<Planet> moons;
    ArrayList<PVector> orbitPos;

    PShape globe;

    Planet(float radius, float distance, float speed, float curveAmount, int index) {
        this.radius = radius;
        this.distance = distance;
        this.speed = speed;
        this.angle = 0;
        this.curveAmount = curveAmount; 
        this.orbitAngle = 0;
        
        moons = new ArrayList();
        orbitPos = new ArrayList();
        
        index = int(random(0, textures.length));
        
        globe = createShape(SPHERE, radius);
        globe.setTexture(textures[index]);  
        globe.setStroke(false);
    }


    void Update() {
        angle += speed;
        orbitAngle += 0.2;
        DrawMoon();
    }
    
    void AddMoon(Planet moon) {
        moons.add(moon);
    }

    void DrawMoon()
    {
        for (Planet moon : moons)
        {
            moon.Update();
        }
    }

    void Display() {
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
    
    void ShowOrbit()
    {
      
    }
}
