function Der=dT(Tr,t,v)
l=length(Tr);
if v == 1
    T=(Tr*1000000+0.9310)/4.8497;
end
if v == 0
    a  = 0.0039324534;
    b  = -1.6326413*10^-6;
    T0 = 0;
    R0 = 100.07271;
    T = T0 + (-R0*a+((R0*a)^2-4*b*R0*(R0-Tr)).^(1/2))/(2*R0*b);
end

for i=2:l-1
    p(i-1)=(T(i+1)-T(i-1))/(t(1+i)-t(i-1));
end
Init=p(2)+(p(2)-p(1))*(t(1)-t(2))/(t(3)-t(2));
End=p(l-2);
Der=[t,[Init;p';End]];
end

%%esto calcula la derivada de la temperatura en funcion del tiempo, para
%%los mismos tiempos de las mediciones (aproximadamente)