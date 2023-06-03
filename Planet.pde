class Planet {
    float radius;
    float distance;
    float speed;
    float angle;

    ArrayList<Planet> moons;

    PShape globe;

    Planet(float radius, float distance, float speed, int index) {
        this.radius = radius;
        this.distance = distance;
        this.speed = speed;
        this.angle = 0;
        
        moons = new ArrayList();
        
        index = int(random(0, textures.length));
        
        globe = createShape(SPHERE, radius);
        globe.setTexture(textures[index]);  
    }

    void AddMoon(Planet moon) {
        println(moons.size());
        moons.add(moon);
    }

    void Update() {
        angle += speed;
        
        for (Planet moon : moons)
        {
            moon.Update();
        }
        
    }

    void Display() {
        float x = distance * cos(angle);
        float z = distance * sin(angle);

        pushMatrix();
        
        stroke(255);
        translate(x, 0, z);
        fill(255);
        noStroke();
        shape(globe);
        
        for (Planet moon : moons)
        {
            moon.Display();
        }
        
        popMatrix();
    }
}
