function cl=clean(x,n)
l=length(x(:,1));
k=1;
for i=1:l-1
    if x(i+1,n)>=x(k,n)
        cl(k,:)=x(i,:);
        k=k+1;
    end
end
end