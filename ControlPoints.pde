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
        controlPoints[0] = new PVector(random(-width, width), -height);
        controlPoints[1] = new PVector(random(-width, width), -height + (height / 2));
        controlPoints[2] = new PVector(random(-width, width), height - (height / 2));
        controlPoints[3] = new PVector(random(-width, width), height);
    }
    
    void RandomizePoints()
    {
        for (int i = 0; i < controlPoints.length; ++i) 
        {
            float x = random(-width, width);
            float y = random(-height, height);

            controlPoints[i] = new PVector(x, y);
        }
    }

    PVector[] getControlPoints()
    {
        return controlPoints;
    }
}
