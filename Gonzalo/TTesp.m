function B = TTesp (A)
l=length(A(:,1));
a=length(A(1,:));
B=zeros(l,2);
for i=1:l
  if floor(A(i,1)/10000)-12 < 0
    H=floor(A(i,1)/10000);
    else
    H=floor(A(i,1)/10000)-12;
  end
    B(i,1)=(H*60 + floor((A(i,1)-10000*floor(A(i,1)/10000))/100))*60+A(i,1)-100*floor(A(i,1)/100);
end
B=[B(:,1),A(:,a)];
end

