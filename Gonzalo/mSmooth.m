function Res=mSmooth(Y,X=[1:length(Y)],n);
%Y=T(:,2);
%X=T(:,1);
%n=2;
l=length(Y);
for i=1:l
  m=max(1,i-3*n);
  M=min(l,i+3*n);
  if 2*std(Y(m:M)) < abs(Y(i)-mean(Y(m:M)))
    p(i)=0;
    else
    p(i)=1;
  end
end
pY=Y.*p;
for i=1:l
  m=max(1,i-n);
  M=min(l,i+n);
  S(i)=sum(pY(m:M))/sum(p(m:M));
  end
for i=1:l
  m=max(1,i-n);
  M=min(l,i+n);
  e(i)=sum(abs(S(m:M)'-Y(m:M)))/(M-m+1);
  end
  Res=[S',e',p'];
end
