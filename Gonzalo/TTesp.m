function B = TTesp (A)
l=length(A(:,1));
a=length(A(1,:));
B=zeros(l,2);
for i=1:l
    B(i,1)=((floor(A(i,2)/10000)-12)*60 + floor((A(i,2)-10000*floor(A(i,2)/10000))/100))*60+A(i,2)-100*floor(A(i,2)/100);
end
B=[B(:,1),A(:,a-1)];
end

