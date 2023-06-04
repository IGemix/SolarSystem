class ControlPoints
{
    PVector[] controlPoints;
    
    ControlPoints(PVector[] controlPoints)
    {
        this.controlPoints = new PVector[4];
        this.controlPoints = controlPoints;
    }
    
    void OrbitPoints()
    {
        controlPoints[0] = new PVector(1000, 0);
        controlPoints[1] = new PVector(0, 1000);
        controlPoints[2] = new PVector(1000, 0);
        controlPoints[3] = new PVector(0, 1000);

    }
    
    void RandomizePoints()
    {
        for (int i = 0; i < controlPoints.length; ++i) 
        {
            float x = random(width);
            float y = random(height);

            controlPoints[i] = new PVector(x, y);
        }
    }

    PVector[] getControlPoints()
    {
        return controlPoints;
    }
}
