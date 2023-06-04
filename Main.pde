import java.io.File;

PImage sunTexture;
PImage[] textures;

int dim = 100;
float x[] = new float[dim];
float y[] = new float[dim];
float t = 0;

Planet sun;
Planet earth;
Planet mars;
Planet moon;

void setup() 
{
    size(800, 600, P3D);
    
    LoadFiles();
    //LoadStars();

    sun = new Planet(50, 0, 0, 0, 1);

    earth = new Planet(20, 150, 0.01, 100, 1);

    mars = new Planet(15, 200, 0.02, 300, 1);

    moon = new Planet(5, 30, 0.05, 10, 1);
      
    earth.AddMoon(moon);
}

void draw() 
{
    background(0);
    translate(width / 2, height / 2);
    
    /*
    for(int i = 0; i < x.length; i++)
    {
        ellipse(x[i], y[i], 0.5 * sin(t + i / 2) + 2, 0.5 * sin(t + i / 2) + 2);
    }
    */

    sun.Update();
    earth.Update();
    mars.Update();
    
    sun.angle = earth.angle;
    
    sun.Display();
    earth.Display();
    mars.Display();
    
    stroke(255);
    noFill();
    
    beginShape();
    for(float angle = 0; angle < TWO_PI + 1; angle += 0.1)
    {
        float x = earth.distance * cos(angle);
        float y = earth.distance * sin(angle);
        float z = earth.curveAmount * sin(angle);
        vertex(x, y, z);
    }
    endShape();
}

void LoadFiles()
{
    java.io.File folder = new java.io.File(sketchPath("Textures/PlanetTextures"));
    String[] filenames = folder.list();
    
    sunTexture = loadImage("Textures/Sun.jpg");

    println(filenames.length + " files in specified directory");
    
    textures = new PImage[filenames.length];

    for (int i = 0; i < textures.length; i++)
    {
        textures[i] = loadImage("Textures/PlanetTextures/" + filenames[i]);
    }
}

void LoadStars()
{
    for (int i = 0; i < x.length; i++)
    {
        x[i] = random(width) * 4 - 1100;
        y[i] = random(height) * 4 - 600;
    }
}
