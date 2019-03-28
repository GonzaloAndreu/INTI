function F=Filt(A,n,m)
i=1;
while A(i,n)<m
    F(i,:)=A(i,:);
    i=i+1;
end
end