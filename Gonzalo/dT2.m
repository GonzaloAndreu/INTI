function Derivate=dT2(Data_Temp) %Esta funcion toma la derivada discreta de la temperaturas para datos 
Time=Data_Temp(:,1);             %YA TRANSFORMADOS A TEMPERATURA
for i=1:(length(Data_Temp(1,:))-1)
    Temp(:,i)=Data_Temp(:,1+i);
end

l=length(Time);
for i=2:l-1
  p(i-1,:)=(Temp(i+1,:)-Temp(i-1,:))/(Time(1+i)-Time(i-1));
end
Init=p(2,:)+(p(2,:)-p(1,:))*(Time(1)-Time(2))/(Time(3)-Time(2));
End=p(l-2,:);
Derivate=[Time,[Init;p;End]];
end