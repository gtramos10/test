clear;
close;
PtM=30;
PtP=20;
Fc=850;
N=1000; % tiempo de simulacion
M=10;   % Numero de Moviles
color='k';
handover=0;
bs = rsmak('circle',500,[0,0]);
bs2 = rsmak('circle',50,[200,200]);
fnplt (bs,'b'), axis square;
hold on
fnplt (bs2,'b'), axis square;

M1 (1:N) = struct ('id',0,'position_x',0,'position_y',0,'PrS',0,'PrN',0,'CellID',0);

    for i=1:N
        
        %[M1(i).position_x,M1(i).position_y]=RandomWalk (M1,i);%Modelo de Movilidad
        [M1(i).position_x,M1(i).position_y]=RandomDir (M1,i);%Modelo de Movilidad
        Pmacro(i)=Potencia_recibida_indoor(200,200,PtP,Fc,M1(i).position_x,M1(i).position_y);
        Ppico(i)=Potencia_recibida_outdoor(0,0,PtM,Fc,M1(i).position_x,M1(i).position_y);
        M1(i).PrS=max(Pmacro(i),Ppico(i));
        M1(i).PrN=min(Pmacro(i),Ppico(i));
        
        if i>1
        [handover,M1(i).CellID] = function_handover(Pmacro(i),Ppico(i), 0, i,M1(i-1).CellID);
        end
        x(i)=M1(i).position_x;
        y(i)=M1(i).position_y;
        
        if (Pmacro(i)<Ppico(i)) 
        color='k';
        else
            color='g';
        end
        %comet(x,y)
            plot(x,y,'color',color,'EraseMode', 'none')
            if (handover==1)
                HO = rsmak('circle',5,[M1(i).position_x,M1(i).position_y]);
                fnplt (HO,'b'), axis square;
            end
            
        drawnow;
        pause(0.01);
    end


