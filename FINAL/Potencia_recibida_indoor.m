function Pr= Potencia_recibida_indoor(xr,yr,Pt,fc,xm,ym)
%Pt[W],fc[MHz]
Gt=1;%dB
Gr=1;%dB
c=3*10^8;%velocidad de la luz
fcHz=fc*1000000;%fc[Hz]
lambda=c/fcHz;
%alfa=2;%path-loss Exponent free-space
d=sqrt((xm-xr)^2+(ym-yr)^2);
%Xsigma=randn();
%PtdBm=10*log10(Pt*1000);

%Pl=Pl0+(20*log10(d/d0));
Pr=Pt+Gt+Gr-20*log10((4*pi*d)/lambda);%-Pl;
