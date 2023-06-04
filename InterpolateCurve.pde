class InterpolateCurve
{
    // La curva de interpolacion siempre tiene 4 puntos de control
    // Formula: p(u) = C0 + C1 * u + C2 * u^2 + c3 * u^3 -> Interpolate
    PVector[] controlPoints;
    PVector[] coefficients;

    int numOfPoints;

    color curveColor;
    int curveWeight;

    InterpolateCurve(PVector[] controlPoints, int numOfPoints, color curveColor, int curveWeight)
    {
        this.controlPoints = new PVector[4];
        this.controlPoints = controlPoints;

        this.coefficients = new PVector[4];
        for (int i = 0; i < this.coefficients.length; i++)
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
        INTERPOLATION FORMULA
        C0 = P0
        C1 = -5.5P0 + 9P1 - 4.5P2 + P3
        C2 = 9P0 - 22.5P1 + 18P2 - 4.5P3
        C3 = -4.5P0 + 13.5P1 - 13.5P2 + 4.5P3
        */

        coefficients[0].x = controlPoints[0].x;
        coefficients[0].y = controlPoints[0].y;

        coefficients[1].x = -5.5 * controlPoints[0].x + 9 * controlPoints[1].x - 4.5 * controlPoints[2].x + controlPoints[3].x;
        coefficients[1].y = -5.5 * controlPoints[0].y + 9 * controlPoints[1].y - 4.5 * controlPoints[2].y + controlPoints[3].y;

        coefficients[2].x = 9 * controlPoints[0].x - 22.5 * controlPoints[1].x + 18 * controlPoints[2].x - 4.5 * controlPoints[3].x;
        coefficients[2].y = 9 * controlPoints[0].y - 22.5 * controlPoints[1].y + 18 * controlPoints[2].y - 4.5 * controlPoints[3].y;

        coefficients[3].x = -4.5 * controlPoints[0].x + 13.5 * controlPoints[1].x - 13.5 * controlPoints[2].x + 4.5 * controlPoints[3].x;
        coefficients[3].y = -4.5 * controlPoints[0].y + 13.5 * controlPoints[1].y - 13.5 * controlPoints[2].y + 4.5 * controlPoints[3].y;
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
