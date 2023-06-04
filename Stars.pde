class Star 
{
    PVector pos;
    PVector vel;
    float gravity;
    EulerSolver euler;

    Star(float x, float y)
    {
        pos = new PVector(x, y);
        vel = new PVector(random(-2, 2), random(2, 5));
        euler = new EulerSolver(pos, vel, new PVector(0, 0), new PVector(0, 0));
    }
    
    void Update()
    {
        //vel.y += gravity;
        euler.Solver();
        pos.add(euler.GetVelocity());


        //pos.y = euler.GetPosition().y;

        
        if (pos.y > height)
        {
            pos.y = -height;
            pos.x = random(-width, width);
        }
    }
    
    void Display()
    {
        stroke(255);
        strokeWeight(2);

        point(pos.x, pos.y);
    }
}
