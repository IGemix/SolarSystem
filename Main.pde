import java.io.File;
import camera3D.Camera3D; 

Camera3D estereoscopia; 

PImage[] textures;

Planet sun;
Planet planet1;
Planet planet2;
Planet planet3;
Planet planet4;
Planet planet5;

Planet moon1;
Planet moon2;
Planet moon3;

ArrayList<Star> stars;

void setup() 
{
    size(800, 600, P3D);
    LoadFiles();

    stars = new ArrayList<Star>();

    for(int i = 0; i < 1000; i++)
    {
        float x = random(-width, width);
        float y = random(height);
        stars.add(new Star(x, y));
    }

    sun = new Planet(50, 0, 0, 0, 0);

    planet1 = new Planet(15, 100, 0.001, 0, 1);
    planet2 = new Planet(25, 200, 0.002, 0, 2);
    planet3 = new Planet(40, 300, 0.005, 0, 3);
    planet4 = new Planet(70, 450, 0.003, 0, 4);
    planet5 = new Planet(50, 600, 0.0005, 0, 5);

    moon1 = new Planet(15, 35, 0.02, 0, 0);
    moon2 = new Planet(10, 60, 0.02, 0, 0);
    moon3 = new Planet(20, 60, 0.02, 0, 0);

    planet1.AddMoon(moon1);
    planet2.AddMoon(moon2);
    planet3.AddMoon(moon3);

    estereoscopia = new Camera3D(this); 
    estereoscopia.setBackgroundColor(color(255));
    estereoscopia.renderDefaultAnaglyph().setDivergence(0); 
}

void draw() 
{
    background(0);
    translate(width / 2, (height / 2) - 250, -500);
    rotateX(180);   
    
    for (Star star : stars)
    {
        star.Update();
        star.Display();
        //star.bezierCurve.DrawCurve();
        //star.interpolateCurve.DrawCurve();
    }

    UpdatePlanets();
    DisplayPlanets();
    ShowOrbitPlanets();
}

void UpdatePlanets()
{
    sun.Update();
    planet1.Update();
    planet2.Update();
    planet3.Update();
    planet4.Update();
    planet5.Update();
}
void DisplayPlanets()
{
    sun.Display();
    lights();
    planet1.Display();
    planet2.Display();
    planet3.Display();
    planet4.Display();
    planet5.Display();
}
void ShowOrbitPlanets()
{
    sun.ShowOrbit(planet1);
    sun.ShowOrbit(planet2);
    sun.ShowOrbit(planet3);
    sun.ShowOrbit(planet4);
    sun.ShowOrbit(planet5);
}

void LoadFiles()
{
    java.io.File folder = new java.io.File(sketchPath("Textures/PlanetTextures"));
    String[] filenames = folder.list();
    
    println(filenames.length + " files in specified directory");
    
    textures = new PImage[filenames.length];

    for (int i = 0; i < textures.length; i++)
    {
        textures[i] = loadImage("Textures/PlanetTextures/" + filenames[i]);
    }
}
