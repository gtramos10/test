function [x,y] = RandomDir (r_walk,i,j)
             global angulo;
             global delta;
             V=9;
        r_walk(i).id=i;
        
        if(mod(i-1,V)==1)
        angulo(j)=rand()*pi;
        end
        
        if i==1
            x=500*rand()-500*rand();
            y=((-1)^round(rand()))*sqrt(250000-(x)^2);
           % x=500;
           % y=0;
        
        else
          
         if(mod(i-1,V)==1)      
                delta(j)=-2*((r_walk(i-1).position_x*cos(angulo(j)))+(r_walk(i-1).position_y*sin(angulo(j))))/V;
          end
                x=r_walk(i-1).position_x+delta(j)*cos(angulo(j));
                y=r_walk(i-1).position_y+delta(j)*sin(angulo(j));
        end
end