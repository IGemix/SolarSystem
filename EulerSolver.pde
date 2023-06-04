class EulerSolver
{
    PVector pos; 
    PVector vel;
    PVector accel;
    PVector force;

    float speedLimit;

    float deltaT;
    float masa;

    EulerSolver(PVector pos, PVector vel, PVector accel, PVector force)
    {
        this.pos = pos;
        this.vel = vel;
        this.accel = accel;
        this.force = force;

        speedLimit = 1;

        masa = 1.0;
        deltaT = 0.04;
    }

    void Solver()
    {
        force.x = 0.0;
        force.y = 0.0;

        force.x = 0.0;
        force.y = 9.8;
        if (vel.x > speedLimit || vel.y > speedLimit)
        {
            vel.y = speedLimit; 
        } 
        else 
        {
            accel.x = force.x / masa;
            accel.y = force.y / masa;
        }
        vel.x += accel.x * deltaT;
        vel.y += accel.y * deltaT;

        pos.x += vel.x * deltaT;
        pos.y += vel.y * deltaT; 
    }

    PVector GetPosition()
    {
        return pos;
    }
    
    PVector GetVelocity()
    {
        return vel;
    }
}
