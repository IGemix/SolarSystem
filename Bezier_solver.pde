class bezier_solver
{
    PVector[] points_curve_shape;
    PVector[] coefficient_curve;
    
    bezier_solver(PVector[] pcs)
    {
        points_curve_shape = new PVector[4];
        coefficient_curve = new PVector[4];
        for(int i = 0; i < 4; i++)
        {
            points_curve_shape[i] = new PVector(0,0);
            coefficient_curve[i] = new PVector(0,0);

            points_curve_shape[i].x = pcs[i].x;
            points_curve_shape[i].y = pcs[i].y;
        }

        compute_coeffincients();
    }

    void compute_coeffincients()
    {
        // Ecuaciones de Bezier
        // C0 = P0
        coefficient_curve[0].x = points_curve_shape[0].x;
        coefficient_curve[0].y = points_curve_shape[0].y;
        // C1 = =3P0 + 3P1
        coefficient_curve[1].x = -3 * points_curve_shape[0].x + 3 * points_curve_shape[1].x;
        coefficient_curve[1].y = -3 * points_curve_shape[0].y + 3 * points_curve_shape[1].y;
        // C2 = 3P0 - 6P1 + 3P2
        coefficient_curve[2].x = 3 * points_curve_shape[0].x - 6 * points_curve_shape[1].x + 3 * points_curve_shape[2].x;
        coefficient_curve[2].y = 3 * points_curve_shape[0].y - 6 * points_curve_shape[1].y + 3 * points_curve_shape[2].y;
        // C3 = -P0 + 3P1 - 3P2 + P3
        coefficient_curve[3].x = -1.0 * points_curve_shape[0].x + 3 * points_curve_shape[1].x - 3 * points_curve_shape[2].x + points_curve_shape[3].x;
        coefficient_curve[3].y = -1.0 * points_curve_shape[0].y + 3 * points_curve_shape[1].y - 3 * points_curve_shape[2].y + points_curve_shape[3].y;
    }
}