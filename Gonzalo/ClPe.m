function X = ClPe(A)
l=length(A(:,1));
X(1,:)=A(1,:);
j=2;
for i=2:l-1
    if A(i,1)-A(i-1,1)<(A(i+1,1)-A(i,1))*1.5
        X(j,:)=A(i,:);
        j=j+1;
    end
end
X(j,:)=A(l,:);
end

