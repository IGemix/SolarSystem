class BezierCurve 
{
    PVector[] controlPoints;
    PVector[] coefficients;

    int numOfPoints;

    color curveColor;
    int curveWeight;

    float curvePoint = 0;
    float speed = 0.004;

    BezierCurve(PVector[] controlPoints, int numOfPoints, color curveColor, int curveWeight)
    {  
        this.controlPoints = new PVector[4];
        this.controlPoints = controlPoints;
    
        this.coefficients = new PVector[4];
        for (int i = 0; i < this.coefficients.length; ++i) 
        {
            this.coefficients[i] = new PVector(0, 0);
        }

        this.numOfPoints = numOfPoints;
        this.curveColor = curveColor;
        this.curveWeight = curveWeight;
        
        CalculateCoefficient();
    }

    void CalculateCoefficient()
    {
        /* 
        BEZIER FORMULA

        C0 = P0
        C1 = -3 * P0 + 3 * P1
        C2 = 3 * P0 - 6 * P1 + 3 * P2
        C3 = -P0 + 3 * P1 - 3 * P2 + P3
        
        */

        coefficients[0].x = controlPoints[0].x;
        coefficients[0].y = controlPoints[0].y;

        coefficients[1].x = -3 * controlPoints[0].x + 3 * controlPoints[1].x;
        coefficients[1].y = -3 * controlPoints[0].y + 3 * controlPoints[1].y;

        coefficients[2].x = 3 * controlPoints[0].x - 6 * controlPoints[1].x + 3 * controlPoints[2].x; 
        coefficients[2].y = 3 * controlPoints[0].y - 6 * controlPoints[1].y + 3 * controlPoints[2].y; 

        coefficients[3].x = -controlPoints[0].x + 3 * controlPoints[1].x - 3 * controlPoints[2].x + controlPoints[3].x;
        coefficients[3].y = -controlPoints[0].y + 3 * controlPoints[1].y - 3 * controlPoints[2].y + controlPoints[3].y;
    }
    
    void MoveItem()
    {
        curvePoint += speed;
        
        if(curvePoint >= 1)
        {
            curvePoint = 0;
        }
        
        float x = coefficients[0].x +
        coefficients[1].x * curvePoint +
        coefficients[2].x * curvePoint * curvePoint + 
        coefficients[3].x * curvePoint * curvePoint * curvePoint;
        
        float y = coefficients[0].y + 
        coefficients[1].y * curvePoint +
        coefficients[2].y * curvePoint * curvePoint +
        coefficients[3].y * curvePoint * curvePoint * curvePoint;

        strokeWeight(20);
        stroke(255, 0, 255);
        point(x, y);
        strokeWeight(1);
    }
    
   
    void DrawCurve()
    {
        ArrayList<PVector> lineBetweenPoints = new ArrayList<PVector>(); 
      
        strokeWeight(curveWeight);
        stroke(curveColor);
        
        float uIncrement = 1f / (float)numOfPoints;
        
        float x;
        float y;

        for(float u = 0f; u <= 1f; u += uIncrement)
        {
            x = coefficients[0].x + coefficients[1].x * u + coefficients[2].x * (u * u) + coefficients[3].x * (u * u * u);
            y = coefficients[0].y + coefficients[1].y * u + coefficients[2].y * (u * u) + coefficients[3].y * (u * u * u);
            
            point(x, y);
            lineBetweenPoints.add(new PVector(x, y));
        }

        for (int i = 0; i < lineBetweenPoints.size(); i++)
        {
            if (i < lineBetweenPoints.size() - 1)
            {
                line(lineBetweenPoints.get(i).x, lineBetweenPoints.get(i).y, lineBetweenPoints.get(i + 1).x, lineBetweenPoints.get(i + 1).y);
            }
        }
    }
}
