function [y]= PromedioMovil (x)
M = 4;
B = ones(M,1)/M;
y = filter(B,1,x);

end