function M = Match5(Temp,dTemp,Res,num_Patron,Temp_Banio)
%la funcion dva a tomar como cvalores de entrada, los datos de temperatura,
%los datos de resistencia, los tres ultimos digitos del numero de serie del
%resistor patron, y la temperatura del baño. se desestima la incerteza 
%producida por variaciones en la temperatura del baño.

%en este sector se definen los patrones que se puedan ir utilizando con el
%formato del ya puesto
if num_Patron == 052
    R0=0.99996938;
    u=0.23e-6; %incerteza R0
    a=7.82e-6; %alfa
    b=-5.13e-7; %beta
    T0=0; %Temperatura a la que se mide R0
end
    
%aca se define el valor actual del patron segun la temperatura a la que se encuentra    
Patron=R0*(1+a*(Temp_Banio-T0)+b*(Temp_Banio-T0).^2);
uPatron=R0*(a*u+2*b*u*(Temp_Banio-T0));

q = length(Res(1,:));
LR = length(Res(:,1));
LT = length(Temp(:,1));
k  = 1;
M=[];

A_T=length(Temp(1,:));
A_dT=length(dTemp(1,:));

%en la sigiuiente parte se hacen los calculos para interpolar los calores
%de resistencia con los de temperatura, o al revez
%los datos entregados van a ser:
%[tiempo de medicion,temperatura,valor de resistencia,incerteza del valor de resistencia, derivadas de la temperatura]
if LT <= LR
    for i = 1:LT
      for j=1:LR-1;
        if Temp(i,1) > Res(j,1) && Temp(i,1) < Res(j+1,1)
            Interpolacion_Resistencia=Res(j,q)+(Res(j+1,q)-Res(j,q))*(Temp(i,1)-Res(j,1))/(Res(j+1,1)-Res(j,1));
            M(k,:) = [Temp(i,:),Interpolacion_Resistencia*Patron,Interpolacion_Resistencia*uPatron,dTemp(i,2:A_dT)];
            k=k+1;
        end
      end
    end
    else
    for i = 1:LR
      for j=1:LT-1;
        if Res(i,1) >= Temp(j,1) && Res(i,1) < Temp(j+1,1)
            Interpolacion_Temperatura=Temp(j,:)+(Temp(j+1,:)-Temp(j,:))*(Res(i,1)-Temp(j,1))/(Temp(j+1,1)-Temp(j,1));
            Interpolacion_dTemperatura=dTemp(j,:)+(dTemp(j+1,:)-dTemp(j,:))*(Res(i,1)-dTemp(j,1))/(dTemp(j+1,1)-dTemp(j,1));
            M(k,:) = [Res(i,1),Interpolacion_Temperatura(2:A_T),Res(i,q)*Patron,Res(i,q)*uPatron,Interpolacion_dTemperatura(2:A_dT)];
            k=k+1;
        end
      end
    end
end

end