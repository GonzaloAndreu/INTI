load('Mediciones_Finales.mat')
%para cambiar de resitor haria falta cambiar todos los valores de amperaje
%por el de otro

%cosas para analisar
%defino los datos
Proceso=MedicionesFinales.Resistor300A;
Resistencia=Proceso.Resistencia;
TempRes=Proceso.TempRes;
TempAmb=Proceso.TempAmb;

%los acomodo para que puedan usarse en match y dT
ResMed=TR(Resistencia);
TempMed_TCK_TRP=TU_Temp(TempAmb,[0,2]);
TempMedDallas=TU_Temp(TempRes,'D');
%saco derivadas de temperatura
dTempMed_TCK_TRP=dT2(TempMed_TCK_TRP);
dTempMedDallas=dT2(TempMedDallas);

%matcheo tiempos
Resultados=Match5(TempMedDallas,dTempMedDallas,ResMed,052,20.024);
%par_Med_2=Match5(TempMed_TCK_TRP,dTempMed_TCK_TRP,ResMed,052,20.024);

% FUsiono tablas
%Resultados=[par_Med(:,1:2),par_Med_2(:,2),par_Med(:,3:5),par_Med_2(:,3:5)];

Resultados=MedicionesFinales.Resistor300A.Resultados;
fin=length(Resultados(:,1));
a=polyfit(Resultados(10:fin,2),Resultados(10:fin,4),2);
x=linspace(min(Resultados(10:fin,2)),max(Resultados(10:fin,2)),1000);
hold
plot(Resultados(10:fin,2),Resultados(10:fin,4))
plot(x,polyval(a,x),'r')

STD=std(polyval(a,Resultados(10:fin,2))-Resultados(10:fin,4))


legend('Medicion con el puente','ajuste','location','northeast');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Temperatura (�C)','FontSize',20);
ylabel('Valor de resistencia (\mu\Omega)','FontSize',20);

ax = gca;
ax.FontSize = 15



%R0=(3/4)*(a(2)^2/a(1))+a(3);
%T0=a(2)/(2*a(1));
T0=0;
R0=polyval(a,T0);
alfa=(a(2)+2*a(1)*T0)/R0;
beta=a(1)/R0;



%Datos del patron
PR0=0.99996938;
Pu=0.23e-6; %incerteza R0
Pa=7.82e-6; %alfa
Pb=-5.13e-7; %beta
PT0=0
T=20.024 %temperatura del ba�o
%incertidumbre asociado al patron, viene de certificado
PT=PR0*(1+Pa*(T-PT0)+Pb*(T-PT0)^2);
dPT=Pu/2; %se divide por dos por el factor de cobertura


PR0*Pa*0.001
%incertidumbre asociada a la medicion minima del puente
medmin=0.00004;
dMinPuente=medmin/(12^(1/2));



%incertidumre estadistica asociada a la medicion de temperatura con el sensor dallas
%se desprecia el aporte a la incertudumbre de las variacioes de la
%temperatura del ba�o termico en el que estan sumergidos los patrones

stdDallas=0.27; %desvio est�ndar
uT=stdDallas;
duT=R0*alfa*uT;

%incertidumbre asociada a la resolucion del sensor dallas

minDallas=0.06; %dato datashet
uminT=R0*alfa*minDallas/(12^(1/2)) %se asume que la distribucion de probabilidades es rectangular


%incertidumbre combinada del valor de resistencia medido
ucR0=(uminT^2+duT^2+dPT^2+dMinPuente^2+STD^2)^(1/2);

%incertidumbre expandida
ueR0=2*ucR0




Proceso.Caracterizacion.R0=R0;
Proceso.Caracterizacion.ueR0=ueR0;
Proceso.Caracterizacion.T0=T0;
Proceso.Caracterizacion.alfa=alfa;
Proceso.Caracterizacion.beta=beta;

Proceso.Caracterizacion



Prueba
