% analisis ruido dallas
load('E:\INTI\Gonzalo\Arduino\Analisis de Ruido y Error de Sensor Dallas\Dallas.mat')

Temp20=Dallas.Temp20;
Temp25=Dallas.Temp25;
Temp30=Dallas.Temp30;
Temp35=Dallas.Temp35;
Temp45=Dallas.Temp45;
Temp55=Dallas.Temp55;
Temp65=Dallas.Temp65;

hold
plot(Temp20(:,4),'LineWidth',2);
plot(Temp25(:,4),'LineWidth',2);
plot(Temp30(:,4),'LineWidth',2);
plot(Temp35(:,4),'LineWidth',2);
plot(Temp45(:,4),'LineWidth',2);
plot(Temp55(:,4),'LineWidth',2);
plot(Temp65(:,4),'LineWidth',2);

legend('horno a 20 ºC','horno a 25 ºC','horno a 30 ºC','horno a 35 ºC','horno a 45 ºC','horno a 55 ºC','horno a 65 ºC','ajuste','location','southeast');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Numero de mediciones','FontSize',20);
ylabel('Temperatura medida (°C)','FontSize',20);

ax=gca
ax.XLim=[0,500]


u=std(polyval(linD,A(:,1))-A(:,2))
Dallas.Caracterizacion.Incerteza=u


load('TermocuplaPlatino.mat')

horno=polyfit(TCPl(:,1),TCPl(:,2),1)

dallas=[horno(1)*20+horno(2),mean(Temp20(:,4)),std(Temp20(:,4));
    horno(1)*25+horno(2),mean(Temp25(:,4)),std(Temp25(:,4));
    horno(1)*30+horno(2),mean(Temp30(:,4)),std(Temp30(:,4));
    horno(1)*35+horno(2),mean(Temp35(:,4)),std(Temp35(:,4));
    horno(1)*45+horno(2),mean(Temp45(:,4)),std(Temp45(:,4));
    horno(1)*55+horno(2),mean(Temp55(:,4)),std(Temp55(:,4));
    horno(1)*65+horno(2),mean(Temp65(:,4)),std(Temp65(:,4))]

A=dallas;
MA=[0,0;0,0];
bA=[0;0];
for i=5:length(A(:,1))
    MA(1,1)=MA(1,1)+1/(A(i,3)^2);
    MA(1,2)=MA(1,2)+A(i,1)/(A(i,3)^2);
    MA(2,1)=MA(2,1)+A(i,1)/(A(i,3)^2);
    MA(2,2)=MA(2,2)+A(i,1)^2/(A(i,3)^2);
    bA(1)=bA(1)+A(i,2)/(A(i,3)^2);
    bA(2)=bA(2)+A(i,1)*A(i,2)/(A(i,3)^2);
end

detMA=(MA(1,1)*MA(2,2)-MA(2,1)*MA(1,2));
ordA=(bA(1)*MA(2,2)-MA(2,1)*bA(2))/detMA
penA=(bA(2)*MA(1,1)-MA(1,2)*bA(1))/detMA


MA=[0,0,0;0,0,0;0,0,0];
bA=[0;0;0];
for i=5:length(A(:,1))
    MA(1,1)=MA(1,1)+1/(A(i,3)^2);
    MA(1,2)=MA(1,2)+A(i,1)/(A(i,3)^2);
    MA(1,3)=MA(1,3)+A(i,1)^2/(A(i,3)^2);
    MA(2,1)=MA(2,1)+A(i,1)/(A(i,3)^2);
    MA(2,2)=MA(2,2)+A(i,1)^2/(A(i,3)^2);
    MA(2,3)=MA(2,3)+A(i,1)^3/(A(i,3)^2);
    MA(3,1)=MA(3,1)+A(i,1)^2/(A(i,3)^2);
    MA(3,2)=MA(3,2)+A(i,1)^3/(A(i,3)^2);
    MA(3,3)=MA(3,3)+A(i,1)^4/(A(i,3)^2);    
    bA(1)=bA(1)+A(i,2)/(A(i,3)^2);
    bA(2)=bA(2)+A(i,1)*A(i,2)/(A(i,3)^2);
    bA(3)=bA(3)+A(i,1)*A(i,2)^2/(A(i,3)^2);
end
mA=MA/sum((1./A(:,3)).^2)
ba=bA/sum((1./A(:,3)).^2)

detmA=det(mA);
X0=det([ba,mA(:,2),mA(:,3)])/detmA
X1=det([mA(:,1),ba,mA(:,3)])/detmA
X2=det([mA(:,1),mA(:,2),ba])/detmA




linD=polyfit(A(:,1),A(:,2),1)

x=linspace(A(1,1),A(7,1),100);
hold
errorbar(A(:,1),A(:,2),A(:,3));
%plot(x,penA*x+ordA)
plot(x,polyval(linD,x))

%Dallas.Caracterizacion.Coef=linD
%Dallas.Caracterizacion.Datos=dallas
legend('Sensor Dallas','ajuste','location','northwest');
lgd = legend;
lgd.FontSize = 20;
grid;
xlabel('Temperatura de referencia (ºC)','FontSize',20);
ylabel('Temperatura medida (°C)','FontSize',20);

u=std(polyval(linD,A(:,1))-A(:,2))
Dallas.Caracterizacion.Incerteza=u