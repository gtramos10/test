function[i, CanalOut] = AsigCanal(Canales)

for i=1:length(Canales)
    if(Canales(i)==0)
       Canales(i)=1;
       break;
    end
end
CanalOut=Canales;
end