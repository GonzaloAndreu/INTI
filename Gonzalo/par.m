function X=par(A)
l=length(A(:,1));
for i=1:l
    X(i,i)=A(i,2);
    if i<l
        X(i,i+1)=A(i+1,2);
    end
    if i>1
        X(i,i-1)=A(i-1,2);
    end
end
end

    