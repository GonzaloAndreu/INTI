function Res=mSmooth(Y0,n,desvio)
    f=@(x,mean) exp(-2*(x-mean).^2/(n^2));
    if iscolumn(Y0)
        Y=Y0';
    else
        Y=Y0;
    end
    l=length(Y);
    for i=1:l
      m=max(1,i-n);
      M=min(l,i+n);
      err=abs(Y(i)-mean(Y(m:M)));
      tolerancia=desvio*std(Y(m:M));
      if err > tolerancia
        p(i)=0;
        else
        p(i)=1;
      end
    end
    for i=1:l
      m=max(1,i-n);
      M=min(l,i+n);
      x=[m:M];
      Weigth=p(m:M).*f(x,i);
      S(i)=(Y(m:M)*Weigth')/sum(Weigth);
    end
    Res=[S',p'];
end
