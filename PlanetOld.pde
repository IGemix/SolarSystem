class PlanetOld
{
    float radius;
    float angle;
    float distance;

    PlanetOld[] planets;
    PlanetOld planet1;
    
    float orbitSpeed;
    PVector v;

    PVector[] bezier_points;
    
    PShape globe;

    PlanetOld(float radius, float distance, float orbitSpeed, PImage img)
    {
        v = PVector.random3D();
        
        this.radius = radius;
        this.distance = distance;
        
        v.mult(distance);

        this.angle = random(TWO_PI);
        this.orbitSpeed = orbitSpeed;

        noStroke();
        noFill();
        
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

    void SpawnMoons(int total, int level, float orbitSpeed, int dist)
    {
        planets = new PlanetOld[total];

        for (int i = 0; i < planets.length; i++) 
        {
            float moonRadius = radius / (level * 2);
            float moonDistance = dist;
            float moonOrbitSpeed = orbitSpeed;

            int index = int(random(0, textures.length));

            planets[i] = new PlanetOld(moonRadius, moonDistance, moonOrbitSpeed, textures[index]);
            if (level < 2)
            {
                int num = 1;
                planets[i].SpawnMoons(num, level + 1, 0.05, dist);
            }
        }
    }

    void SpawnPlanets(int level, float orbitSpeed, int dist)
    {
        float moonRadius = radius / (level * 2);
        float moonDistance = dist;
        float moonOrbitSpeed = orbitSpeed;
        
        int index = int(random(0, textures.length));
        planet1 = new PlanetOld(moonRadius, moonDistance, moonOrbitSpeed, textures[index]);

        if (level < 1)
        {
            planet1.SpawnPlanets(level + 1, orbitSpeed, dist);
        }
    }

    void Show()
    {
        pushMatrix();

        PVector p = v.cross(new PVector(1, 0, 1));

        rotate(angle, p.x, p.y, p.z);
            
        // Axis Visualizer
        //stroke(255);
        //line(0, 0, 0, v.x, v.y, v.z); // Show connection with the planets
        //line(0, 0, 0, p.x * 10, p.y * 10, p.z * 10); // Show axis of the rotation

        translate(v.x, v.y, v.z);

        noStroke();
        
        fill(255);
        shape(globe);
        //sphere(radius);

        if (planet1 != null)
        {
            planet1.Show();
        }

        popMatrix();
    }
}
