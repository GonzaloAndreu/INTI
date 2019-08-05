function B = TR (A)
l=length(A(:,1));
a=length(A(1,:));
B=[A,zeros(l,1)];
for i=1:l
    if B(i,3)<8
        B(i,a+1)=((B(i,3))*60+B(i,4))*60+B(i,5);
    else
        B(i,a+1)=((B(i,3)-12)*60+B(i,4))*60+B(i,5);
    end
end
ext=[0,0];
C=[B(1,1),B(1,2)];
for i=2:l-1
    if abs(B(i,1)-B(i-1,1))>abs(B(i+1,1)-B(i,1))*5
        ext=ext+(B(i,1:2)-B(i-1,1:2))*4/5;
    end
    C(i,:)=B(i,1:2)-ext;
end
C(l,:)=B(l,1:2)-ext;
B=[B(:,a+1),C(:,1)*10^6,C(:,2)*10^6];
end
