function B = TR (A)
l=length(A(:,1));
a=length(A(1,:));
B=[A,zeros(l,1)];
for i=1:l
    if B(i,3)<8
        B(i,a+1)=(B(i,3)*60+B(i,4))*60+B(i,5);
    else
        B(i,a+1)=((B(i,3)-12)*60+B(i,4))*60+B(i,5);
    end
end
B=[B(:,a+1),B(:,1)*10^6,B(:,2)*10^6];
end
