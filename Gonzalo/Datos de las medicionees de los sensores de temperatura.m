load('Medicion_20190531_TresSensoresDeTemperatura.mat')


Med_Par_Dallas=Match5(TempMed_Dallas,dTempMed_Dallas,ResMed,052,20.024);
hold

plot(TempMed_TCK_Termistor(:,1),TempMed_TCK_Termistor(:,3)-TempMed_TCK_Termistor(1,3));
plot(TempMed_TCK_Termistor(:,1),TempMed_TCK_Termistor(:,2)-TempMed_TCK_Termistor(1,2));
plot(TempMed_Dallas(:,1),TempMed_Dallas(:,2))%-TempMed_Dallas(1,2))


%%esto de aca abajo es si se usa el  archivo con nombre 'Medicion190524'
TempMed_Dallas=TU_Temp(Crudo_Temperatura_Dallas,'D');

k=1;
NewMed=[];
for i=1:length(TempMed_Dallas(:,1))
    if TempMed_Dallas(i,2)<55 && TempMed_Dallas(i,2)>0
        NewMed(k,:)=TempMed_Dallas(i,:);
        k=k+1;
    end
end

hold

plot((TempMed_TCK_Termistor(:,1)-TempMed_TCK_Termistor(1,1))/60,TempMed_TCK_Termistor(:,3)-TempMed_TCK_Termistor(1,3));
plot((TempMed_TCK_Termistor(:,1)-TempMed_TCK_Termistor(1,1))/60,TempMed_TCK_Termistor(:,2)-TempMed_TCK_Termistor(1,2));
plot((NewMed(:,1)-TempMed_TCK_Termistor(1,1))/60,NewMed(:,2)-NewMed(1,2))


legend('Termocupla Tipo K','Termistor','Sensor ds18b20','location','southeast');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Tiempo de medicion transcurrido (m)','FontSize',20);
ylabel('\Delta T (°C)','FontSize',20);

ax = gca;
ax.FontSize = 15

std(NewMed(10100:10500,2))

%## a partir de aca vamos a otra cosa


load('Termistor.mat')
A=sortrows([Termistor(:,3),Termistor(:,1)],1)
hold
plot(A(:,1),A(:,2),'-*')
t=linspace(A(1,1),A(length(A(:,1)),1),1000);
plot(t,g(Param,t))



legend('Termistor','ajuste','location','northeast');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Resistencia (\Omega)','FontSize',20);
ylabel('Temperatura (°C)','FontSize',20);

ax = gca;
ax.FontSize = 15

std(A(:,2)-g(Param,A(:,1)))