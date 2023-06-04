class Star 
{
    PVector pos;
    PVector velocity;
    float gravity;
    
    Star(float x, float y)
    {
        pos = new PVector(x, y);
        velocity = new PVector(random(-2, 2), random(2, 5));
    }
    
    void Update()
    {
        velocity.y += gravity;

        pos.add(velocity);

        if (pos.y > height)
        {
            pos.y = -height;
            pos.x = random(-width, width);
        }
    }
// Funciones
void solverEuler(){
  // 0) Limpiar y dar valores a la fuerza
  // 1) Aceleración = Fuerza / Masa
  // 2) Nueva velocidad = Velocidad ant + Aceleración * Dt
  // 3) Nueva posición = Posición ant + Velocidad ant * Dt
  fuerza.x=0.0; // Imprescindible!!!
  fuerza.y=0.0; // Super importante!!!
  fuerza.x=0.0; // De momento sólo gravedad
  fuerza.y=9.8; // De momento sólo gravedad
  aceleracion.x=fuerza.x/masa;
  aceleracion.y=fuerza.y/masa;
  velocidad.x=velocidad.x+aceleracion.x*deltaT;
  velocidad.y=velocidad.y+aceleracion.y*deltaT;
  posicion.x=posicion.x+velocidad.x*deltaT;
  posicion.y=posicion.y+velocidad.y*deltaT;
}
    void Display()
    {
        stroke(255);
        strokeWeight(2);
        point(pos.x, pos.y);
    }
}
