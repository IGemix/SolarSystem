class Star
{
    PVector pos;
    PVector vel;
    float gravity;
    EulerSolver euler;
    
    InterpolateCurve interpolateCurve;
    BezierCurve bezierCurve;

    Star(float x, float y)
    {
        pos = new PVector(x, y);
        vel = new PVector(random(-2, 2), random(2, 5));
        euler = new EulerSolver(pos, vel, new PVector(0, 0), new PVector(0, 0));

        StartInterpolateCurve();
        StartBezierCurve();
    }
    
    void RestartCurves()
    {
        if(restartCurves)
        {
            StartInterpolateCurve();
            StartBezierCurve();
            restartCurves = false;
        }
    }
    
    void Update()
    {
        if (useEuler)
        {
            UseEulerSolver();
        } 
        else { 
            vel.y += gravity;
            pos.add(vel);
        }

        RestartCurves();
  
        if (pos.y > height)
        {
            pos.y = -height;
            pos.x = random(-width, width);
        }
   
    }

    void UseBezierCurve()
    {
        bezierCurve.MoveItem();
    }
    
    void UseInterpolateCurve()
    {
        interpolateCurve.MoveItem();
    }
    
    void UseEulerSolver()
    {
        euler.Solver();
        pos.y = euler.GetPosition().y;
    }
    
    void Display()
    {
        stroke(255);
        point(pos.x, pos.y);
    }

    
    void StartInterpolateCurve()
    {
        PVector[] controlPoints = new PVector[4];
        ControlPoints cp = new ControlPoints(controlPoints);
        
        cp.OrbitPoints();
        controlPoints = cp.getControlPoints();
        
        color curveColor = color(255, 255, 0);

        int curveWeight = 2;
        int numOfPoints = 30;

        interpolateCurve = new InterpolateCurve(controlPoints, numOfPoints, curveColor, curveWeight);
    }

    void StartBezierCurve()
    {
        PVector[] controlPoints = new PVector[4];
        ControlPoints cp = new ControlPoints(controlPoints);
        
        cp.OrbitPoints();
        controlPoints = cp.getControlPoints();
    
        color curveColor = color(255, 0, 255);
        
        int curveWeight = 2;
        int numOfPoints = 30;

        bezierCurve = new BezierCurve(controlPoints, numOfPoints, curveColor, curveWeight);
    }
}
