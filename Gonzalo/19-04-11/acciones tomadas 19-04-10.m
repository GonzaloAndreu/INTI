acciones tomadas 
%%vo a intentar ver si el modelo funciona con algo conocido
t=1:0.1:30;
T=15*(1-exp(-t/10));
T0=20;
R0=100;
a=0.00001;
b=0.0005;

r=@(x) R0*(1+a*(x-T0)-b*(x-T0).^2);
R=r(T+T0);
RM=r(T+T0)+(1-(2.*rand(1,length(T))-1))/10;
TM=(T+T0)+(1-(2.*rand(1,length(T))-1))/20;

AT=(TM-T0)';
AT2=AT.^2;
AT3=AT.^3;
AT4=AT.^4;
DT=dT(TM',t',2);
R0=ones(length(lAT),1);

VT=[-AT,DT(:,2),AT2*6*T0^2,-4*AT3*T0,AT4,R0];
c=lsqnonneg(VT,RM');

hold
plot(TM,RM,'b')
plot(TM,VT*c,'r')
hold off


lAT=T';
lAT2=lAT.^2;
lAT3=lAT.^3;
lAT4=lAT.^4;
lDT=dT(T',t',2);
lR0=ones(length(lAT),1);
lVT=[-lAT,lDT(:,2),lAT2*T0^2-lAT3*T0+lAT4,lR0];
lc=lsqnonneg(lVT,RM');

hold
plot(T+T0,RM,'b')
plot(T+T0,lVT*lc,'r')

hold off


llAT=T';
llAT2=llAT.^2;
llAT3=llAT.^3;
llAT4=llAT.^4;
llDT=dT(T',t',2);
llR0=ones(length(llAT),1);
llVT=[llAT,llDT(:,2),llAT2*6*T0^2,-llAT3*4*T0,llAT4,llR0];
llc=lsqnonneg(llVT,R');

hold
plot(T+T0,R,'b')
plot(T+T0,llVT*llc,'r')

hold off