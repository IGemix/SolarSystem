import java.io.File;
import camera3D.Camera3D; 

Camera3D estereoscopia; 

PImage sunTexture;
PImage[] textures;

Planet sun;
Planet planet1;
Planet planet2;
Planet planet3;
Planet planet4;
Planet planet5;
Planet planet6;

Planet moon1;
Planet moon2;

void setup() 
{
    size(800, 600, P3D);
    LoadFiles();

    sun = new Planet(50, 0, 0, 0, 1);

    planet1 = new Planet(20, 150, 0.01, 300, 1);
    planet2 = new Planet(15, 200, 0.02, 600, 1);
    planet3 = new Planet(30, 250, 0.005, 200, 1);
    planet4 = new Planet(40, 300, 0.02, 500, 1);
    planet5 = new Planet(20, 350, 0.001, 400, 1);
    planet6 = new Planet(10, 400, 0.01, 50, 1);

    moon1 = new Planet(5, 30, 0.05, 50, 1);
    moon2 = new Planet(30, 50, 0.05, 0, 1);
    
    planet1.AddMoon(moon1);
    planet3.AddMoon(moon2);
   
    estereoscopia = new Camera3D(this);  // Constructor
    estereoscopia.setBackgroundColor(color(192));  // El color de fondo es un gris claro
    estereoscopia.renderDefaultAnaglyph().setDivergence(0);  // La divergencia siempre sera un numero pequeño
}

void draw() 
{
    background(0);
    translate(width / 2, height / 2, -500);
    rotateY(PI/3);    
    sun.Update();
    planet1.Update();
    planet2.Update();
    planet3.Update();
    planet4.Update();
    planet5.Update();
    planet6.Update();

    sun.angle = planet1.angle;
    
    sun.Display();
    planet1.Display();
    planet2.Display();
    planet3.Display();
    planet4.Display();
    planet5.Display();
    planet6.Display();

    sun.ShowOrbit(planet1);
    sun.ShowOrbit(planet2);
    sun.ShowOrbit(planet3);
    sun.ShowOrbit(planet4);
    sun.ShowOrbit(planet5);
    sun.ShowOrbit(planet6);
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
