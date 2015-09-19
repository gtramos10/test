function Pr= Potencia_recibida_outdoor(xr,yr,Pt,fc,xm,ym)
%Pt[W],fc[MHz]
Gt=1;%dB
Gr=1;%dB
c=3*10^8;%velocidad de la luz
fcHz=fc*1000000;%fc[Hz]
lambda=c/fcHz;
alfa=2;%path-loss Exponent free-space
d=sqrt((xm-xr)^2+(ym-yr)^2);%[m]
d0=10;%[m]
sigma=1;

%Xsigma=randn();
Xsigma=normrnd(0,sigma);
%PtdBm=10*log10(Pt*1000);

Pl0=20*log10((4*pi*d0)/lambda);
%Pl=Pl0+(30*log10(fc))+(10*alfa*log10(d/d0))+Xsigma;
Pl=Pl0+(10*alfa*log10(d/d0))+Xsigma;
Pr=Pt-Pl;