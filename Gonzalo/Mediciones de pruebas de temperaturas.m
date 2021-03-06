%Mediciones de pruebas de temepratura

%Prueba con termistor
load('19-05-03/Termistor.mat')

CrudoResistencia=Termistor.CrudoResistencia;
CrudoTemperatura=Termistor.CrudoTemperatura;

Res=TR(CrudoResistencia);
Temp=TU_Temp(CrudoTemperatura,['T',0]);
dTemp=dT2(Temp);
Resultado=Match5(Temp,dTemp,Res,052,20);

Resultado=Termistor.Resultado;
plot(Resultado(:,2)-Resultado(1,2),Resultado(:,3))
%grafico de la variacion de temperatura del resistor en funcion del tiempo
%que tomo hacerla medicion, osea deltaTvsMinutos
plot((Resultado(:,1)-Resultado(1,1))/60,Resultado(:,2)-Resultado(1,2)) 


legend('Termistor','location','southeast');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Tiempo de medicion transcurrido (m)','FontSize',20);
ylabel('\Delta T (�C)','FontSize',20);

ax = gca;
ax.FontSize = 15

u=std(Temp(2400:2700,2)-Temp(1,2))
Termistor.Incertidumbre=u

%Prueba con termocupla
Bien=load('Medicion190412-TCK.mat')
Mal=load('19-05-02/TCPK.mat')

Bien.ResMed=TR(Bien.Crudo_Resistencia);
Bien.TempMed=TU_Temp(Bien.Crudo_Temperatura,['k',0]);
Bien.dTempMed=dT2(Bien.TempMed);
Bien.Resultado=Match5(Bien.TempMed,Bien.dTempMed,Bien.ResMed,052,20);



Mal.ResMed=TR(Mal.Res);
Mal.TempMed=TU_Temp(Mal.Temp,['P',0]);
Mal.dTempMed=dT2(Mal.TempMed);
Mal.Resultado=Match5(Mal.TempMed,Mal.dTempMed,Mal.ResMed,052,20);



hold
clear%plot((Mal.TempMed(:,1)-Mal.TempMed(1,1))/60,Mal.TempMed(:,2)-Mal.TempMed(1,2))

legend('Termocupla tipo K','location','southeast');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Tiempo de medici�n transcurrido (minutos)','FontSize',20);
ylabel('\Delta T (�C)','FontSize',20);

ax = gca;
ax.FontSize = 15

axes('Position',[.5 .4 .3 .3])
box on
plot((Bien.TempMed(3000:3630,1)-Bien.TempMed(1,1))/60,Bien.TempMed(3000:3630,2)-Bien.TempMed(1,2))

u=std(Bien.TempMed(3000:3630,2)-Bien.TempMed(1,2))
Bien.CaracteristicasTCK.Incertidumbre=u


%Probando con el sensor dallas
load('Medicion190524.mat')

