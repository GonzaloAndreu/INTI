function K=Conversor(A)
l=length(A(:,1));
h=1;
for i = 1:l
    if A(i,2)<A(i,3)
            a=1;
        else
            a=-1;
        end
    for j= 2:11
        K(h,:)=[A(i,1)+a*(j-2),A(i,j)];
        h=h+1;
    end
end