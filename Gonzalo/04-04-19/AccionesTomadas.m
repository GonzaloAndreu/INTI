load datos.mat
%ccreo estos graficos con baras de error para usar en la mini presentaci√≥n
R1=TR(Resistor);
T1=TT(Temperatura);
M1=Match(T1,R1,0,0,1,0,0,0);
0.552913344746377 %incerteza de la medicion realizada el 26-Sep-18 finalizada a las 03:52:05 PM 

graphics_toolkit("gnuplot");
errorbar(M1(:,2),M1(:,3),M1(:,3)*0.552913344746377e-6);
legend("Resistencia","location","northwest")
set(gcf,'paperorientation','landscape')
set(gca, 'fontsize', 15)
set(ylabel('Resistencia (\mu\Omega)'),'fontsize', 20)
set(xlabel('Temperatura (∞C)'),'fontsize', 20)
%set(gcf,"paperposition", [0.00000 0.00000 8.00000 11.00000])
grid

print 'ResVsTemp400mmO.pdf'


%ahora lo mismo con la 2da medicion
R2=TR(Resistor2);
T2=TT(Temperatura2);
M2=Match(T2,R2,0,0,1,0,0,0);
0.561308477519943  %incerteza de la medicion realizada el 26-Sep-18 finalizada a las 04:28:20 PM 

graphics_toolkit("gnuplot");
errorbar(M2(:,1),M2(:,3),M2(:,3)*0.561308477519943e-6);
legend("Resistencia","box off","location","north","{\fontsize{10} High }")
set(gcf,'paperorientation','landscape')
set(gca, 'fontsize', 15)
set(ylabel('Resistencia (\mu\Omega)'),'fontsize', 20)
set(xlabel('Hora de Medicion (s)'),'fontsize', 20)
set(gcf,"paperposition", [0.00000 0.00000 8.00000 11.00000])
grid

print 'Resistencia400mmO-26Sep18-042820.pdf'



%ahora lo mismo con la 3ra medicion
R3=TR(Resistor3);
T3=TTesp(Temperatura3);
M3=Match(T3,R3,0,0,1,0,0,0);
0.365673050824395   %incerteza de la medicion realizada el 03-Oct-18 finalizada a la 01:09:37 PM 

graphics_toolkit("gnuplot");
errorbar(M3(:,1),M3(:,3),M3(:,3)*0.365673050824395e-6);
legend("Resistencia","box off","location","north","{\fontsize{10} High }")
set(gcf,'paperorientation','landscape')
set(gca, 'fontsize', 15)
set(ylabel('Resistencia (\mu\Omega)'),'fontsize', 20)
set(xlabel('Hora de Medicion (s)'),'fontsize', 20)
set(gcf,"paperposition", [0.00000 0.00000 8.00000 11.00000])
grid

print 'Resistencia400mmO-03Oct18-010937.pdf'




%ahora lo mismo con la 4ta medicion
R4=TR(Resistor4);
T4=TTesp(Temperatura4);
M4=Match(T4,R4,0,0,1,0,0,0);
1.54403564495192   %incerteza de la medicion realizada el 03-Oct-18 finalizada a las 02:25:33

graphics_toolkit("gnuplot");
errorbar(M4(:,1),M4(:,3),M4(:,3)*0.365673050824395e-6);
legend("Resistencia","box off","location","north","{\fontsize{10} High }")
set(gcf,'paperorientation','landscape')
set(gca, 'fontsize', 15)
set(ylabel('Resistencia (\mu\Omega)'),'fontsize', 20)
set(xlabel('Hora de Medicion (s)'),'fontsize', 20)
set(gcf,"paperposition", [0.00000 0.00000 8.00000 11.00000])
grid

print 'Resistencia200mmO-03Oct18-022533.pdf'


%siguiendo con los ajuste

load 'medicion20181210-300A.mat'

sMed2=Match3(sT,sDT,R,0,0,1,0,0,0);
S0=[1.000000000000000;0.006422461211952;0.000542572849965;0.000016367803435;0.000000187638197;100.215984284516011]

A=[sMed2(1:180,4),sMed2(1:180,2),sMed2(1:180,2).^2,-sMed2(1:180,2).^3,sMed2(1:180,2).^4,ones(180,1)];
%sb = lscov(A, sMed2(1:180,3));
sb = lsqnonneg (A, sMed2(1:180,3),S0);
%sb=ols(A,sMed(1:180,3))';

plot(sMed2(1:180,2),sMed2(1:180,3))
hold
plot(sMed2(1:180,2),A*sb)
sb-S0
S0=sb/10+[3;0;0;0;0;1]

B=[sMed2(1:250,4),-sMed2(1:250,2),sMed(1:250,2).^2,ones(250,1)];
sb = lsqnonneg (B, sMed(1:250,3))
%sb=ols(A,sMed(:,3));

plot(sMed2(1:250,2),sMed2(1:250,3))
hold
plot(sMed2(1:250,2),B*sb)