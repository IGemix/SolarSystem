import java.io.File;

Planet sun;

PImage sunTexture;

PImage[] textures = new PImage[1];

void setup() 
{
    size(800, 600, P3D);

    sunTexture = loadImage("Textures/Sun.jpg");
    
    LoadFiles();
    
    sun = new Planet(50, 0, 0, sunTexture);
    sun.SpawnPlanets(3, 0.05, 50);
}

void draw() 
{
    background(0);
    lights();
    translate(width / 2, height / 2);
    
    sun.Show();
    sun.Orbit();
}

void LoadFiles()
{
  
    java.io.File folder = new java.io.File(sketchPath("Textures/PlanetTextures"));
    String[] filenames = folder.list();

    println(filenames.length + " jpg files in specified directory");
    
    for (int i = 0; i < textures.length; i++)
    {
        textures[i] = loadImage("Textures/PlanetTextures/" + filenames[i]);
    }
}
