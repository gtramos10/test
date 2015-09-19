% Validar si mobile_station(i) esta dentro de la fentocelda
%
% Variables de Salida:
% handover, indica si el MS se salio del rango de cobertura de la fentocelda
% in_fcio, indica si esta dentro de la cobertura de la fentocelda
% diff la diferencia entre la potencia de la macrocelda y la fentocelda
%
% Variables de Entrada:
% pot_mc, la potencia de la macrocelda en el punto donde esta el MS
% pot_fc, la potencia de la fentocelda en el punto donde esta el MS
% in_fci, indica si esta dentro de la cobertura de la fentocelda al ser
% esta mejor opcion que la potencia de la macrocelda

function[handover, in_fcio,CanalMovil,CanalMacro,CanalPico] = function_handover(pot_mc, pot_fc,  offset, t,in_fci,Macro,Pico, CanalMovilIN)

handover = 0;

diff = (pot_fc + offset - pot_mc);
if(t==1)
    
end

if diff >= 0
  if in_fci == 0 && t ~= 1
      handover = 1;
  [CanalMovil, CanalPico]=AsigCanal(Pico);
  Macro(CanalMovilIN)=0;
  else
   CanalMovil=CanalMovilIN;
  CanalPico=Pico;
  end
  
  in_fcio = 1;
  

  CanalMacro=Macro;
else
  if in_fci == 1 && t ~= 1
      handover = 1;
    [CanalMovil, CanalMacro] = AsigCanal(Macro);
     Pico(CanalMovilIN)=0;
  else
   CanalMovil=CanalMovilIN;
   CanalMacro=Macro;
  end
  in_fcio = 0;
  
  CanalPico=Pico;
end;
% Fin Validacion de la fentocelda

