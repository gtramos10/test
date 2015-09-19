function GraficaCellID(M1)
j=4;
color='b';
bs = rsmak('circle',500,[0,0]);
bs2 = rsmak('circle',50,[200,200]);
fnplt (bs,'b'), axis square;
hold on
fnplt (bs2,'b'), axis square;

for i=1: length(M1)
             if (M1(j,i).CellID==1)
                 color='r';       
             else
                 color='b';
             end
             HO = rsmak('circle',5,[M1(j,i).position_x,M1(j,i).position_y]);
             fnplt (HO,color), axis square;
             
end