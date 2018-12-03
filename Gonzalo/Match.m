function M = Match(Temp,Res,t,To,P,a1,b1,r)
T=t;
if r==2
  T= (-99.95346*0.0039183615+((99.95346*0.0039183615)^2-4*(-5.6337919e-7)*99.95346*(99.95346-t))^(1/2))/(2*99.95346*(-5.6337919e-7));
end
Patron=P*(1+(T-To)*a1+b1*(T-To)^2);
q = length(Res(1,:));
LR = length(Res(:,1));
LT = length(Temp(:,1));
a  = 0.0039324534;
b  = -1.6326413*10^-6;
T0 = 0;
R0 = 100.07271;
k  = 1;
M=[];
f=@(x) T0 + (-R0*a+((R0*a)^2-4*b*R0*(R0-x))^(1/2))/(2*R0*b);
if LT <= LR
    for i = 1:LT
      for j=1:LR-1;
        if Temp(i,1) > Res(j,1) && Temp(i,1) < Res(j+1,1)
          if (Temp(i,1)-Res(j,1)) <= (Res(j+1,1)-Temp(i,1))
            M(k,:) = [Temp(i,1),f(Temp(i,2)),Res(j,q)*Patron];
            endif
          if (Temp(i,1)-Res(j,1)) > (Res(j+1,1)-Temp(i,1))
            M(k,:) = [Temp(i,1),f(Temp(i,2)),Res(j+1,q)*Patron];
            endif
          k=k+1;
          endif
        endfor
      endfor
    else
    for i = 1:LR
      for j=1:LT-1;
        if Res(i,1) > Temp(j,1) && Res(i,1) < Temp(j+1,1)
          if (Res(i,1)-Temp(j,1)) <= (Temp(j+1,1)-Res(i,1))
            M(k,:) = [Res(i,1),f(Temp(j,2)),Res(i,q)*Patron];
            endif
          if (Res(i,1)-Temp(j,1)) > (Temp(j+1,1)-Res(i,1))
            M(k,:) = [Res(i,1),f(Temp(j+1,2)),Res(i,q)*Patron];
            endif
          k=k+1;
          endif
        endfor        
      endfor
    endif

endfunction

