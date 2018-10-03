function M = Match(Temp,Res)
%Res=MRes1;
%Temp=MTemp1;
LR = length(Res(:,1));
LT = length(Temp(:,1));
a  = 0.0039324534;
b  = -1.6326413*10^-6;
T0 = 0;
R0 = 100.07271;
k  = 1;
f=@(x) T0 + (-R0*a+((R0*a)^2-4*b*R0*(R0-x))^(1/2))/(2*R0*b);
if LT <= LR
%    M = zeros(LT,3);
    for i = 1:LT
        for j=1:LR-1;
            if Temp(i,1) > Res(j,1) && Temp(i,1) < Res(j+1,1)
                if (Temp(i,1)-Res(j,1)) <= (Res(j+1,1)-Temp(i,1))
                    M(k,:) = [Temp(i,1),f(Temp(i,2)),Res(j,3)];
                end
                if (Temp(i,1)-Res(j,1)) > (Res(j+1,1)-Temp(i,1))
                    M(k,:) = [Temp(i,1),f(Temp(i,2)),Res(j+1,3)];
                end
                k=k+1;
            end
        end
    end
else
%    M = zeros(LR,3);
    for i = 1:LR
        for j=1:LT-1;
            if Res(i,1) > Temp(j,1) && Res(i,1) < Temp(j+1,1)
                if (Res(i,1)-Tepm(j,1)) <= (Temp(j+1,1)-Res(i,1))
                    M(k,:) = [Res(i,1),f(Temp(j,2)),Res(i,3)];
                end
                if (Temp(i,1)-Res(j,1)) > (Res(j+1,1)-Temp(i,1))
                    M(k,:) = [Res(i,1),f(Temp(j+1,2)),Res(i,3)];
                end
                k=k+1;
            end
        end        
    end
end

end
