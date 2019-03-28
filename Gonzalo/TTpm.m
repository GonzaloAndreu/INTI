function B = TTpm (A)
l=length(A(:,1));
a=length(A(1,:));
B=[A,zeros(l,1)];
for i=1:l
    B(i,a+1)=B(i,2)*60+B(i,3);
end
B=[B(:,a+1),B(:,4),B(:,5)];
end
