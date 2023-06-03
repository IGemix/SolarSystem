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
    LoadStars();

    // Create the Sun
    sun = new Planet(50, 0, 0, 1);

    // Create the Earth
    earth = new Planet(20, 150, 0.01, 1);

    // Create Mars
    mars = new Planet(15, 200, 0.02, 1);

    moon = new Planet(5, 30, 0.05, 1);
      
    earth.AddMoon(moon);
    
    //sun = new Planet(50, 0, 0, sunTexture);
    //sun.SpawnPlanets(3, 0.05, 50);
}

void draw() 
{
    background(0);
    lights();
    translate(width / 2, height / 2);
    
    /*
    for(int i = 0; i < x.length; i++)
    {
        ellipse(x[i], y[i], 0.5 * sin(t + i / 2) + 2, 0.5 * sin(t + i / 2) + 2);
    }
    */
    sun.Update();
    sun.Display();

    earth.Update();
    earth.Display();

    mars.Update();
    mars.Display();

    //sun.Show();
    //sun.Orbit();
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
