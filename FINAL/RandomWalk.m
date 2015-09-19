function [x,y] = RandomWalk (r_walk,i)
        duracion_t=20;
        r_walk(i).id=i;
        v=rand()*5;
        delta_x=v*duracion_t;
        angulo=rand()*2*pi;
        
        if i==1
            x=delta_x * cos(angulo);
            y=delta_x * sin(angulo);
            
        else
                a=r_walk(i-1).position_x+delta_x*cos(angulo);
                b=r_walk(i-1).position_y+delta_x*sin(angulo);
                 if a^2 + b^2 > 250000  
                      x=r_walk(i-1).position_x; 
                      y=r_walk(i-1).position_y ;                 
                 else
                   x=a;
                   y=b;
                 end
        end
end