class Planet
{
    float radius;
    float angle;
    float distance;

    Planet[] planets;

    float orbitSpeed;
    PVector v;

    PVector[] bezier_points;
    
    PShape globe;

    Planet(float radius, float distance, float orbitSpeed, PImage img)
    {
        v = PVector.random3D();
        
        this.radius = radius;
        this.distance = distance;
        
        v.mult(distance);

        this.angle = random(TWO_PI);
        this.orbitSpeed = orbitSpeed;

        noStroke();
        noFill();
        
        //fill(random(255), random(255), random(255)); // To see if it works
        
        globe = createShape(SPHERE, radius);
        globe.setTexture(img);
    } 

    void Orbit()
    {
        angle += orbitSpeed;

        if (planets != null)
        {
            for (int i = 0; i < planets.length; i++) 
            {
                planets[i].Orbit();  
            }
        }
    }

    void SpawnMoons(int total, int level)
    {
        planets = new Planet[total];

        for (int i = 0; i < planets.length; i++) 
        {
            float moonRadius = radius / (level * 2);
            float moonDistance = random((radius + moonRadius), (radius + moonRadius) * 2);
            float moonOrbitSpeed = random(-0.1, 0.1);

            int index = int(random(0, textures.length));

            planets[i] = new Planet(moonRadius, moonDistance, moonOrbitSpeed, textures[index]);
            if (level < 2)
            {
                int num = 1;
                planets[i].SpawnMoons(num, level + 1);
            }
        }
    }

    void Show()
    {
        pushMatrix();

        PVector p = v.cross(new PVector(1, 0, 1));

        rotate(angle, p.x, p.y, p.z);
        
        stroke(255);
        
        // Axis Visualizer
        //line(0, 0, 0, v.x, v.y, v.z); // Show connection with the planets
        //line(0, 0, 0, p.x * 10, p.y * 10, p.z * 10); // Show axis of the rotation

        translate(v.x, v.y, v.z);

        noStroke();
        
        fill(255);
        shape(globe);
        //sphere(radius);

        if (planets != null)
        {
            for (int i = 0; i < planets.length; ++i) 
            {
                planets[i].Show();
            }
        }

        popMatrix();
    }
}
