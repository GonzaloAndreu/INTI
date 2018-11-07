function M = Semi(A,B)
if A(1,2)<B(1,2)
  Med1=A;
  Med2=B;
  else
  Med1=B;
  Med2=A;
  endif
a=length(Med1(:,1));
b=length(Med2(:,1));
k=1;
for i=1:a
  for l=1:b-1
    if Med2(l,2)<=Med1(i,2) && Med2(l+1,2)>=Med1(i,2)
      if (Med1(i,2)-Med2(l,2)) <= (Med2(l+1,2)-Med1(i,2))
        M(k,:) = [Med1(i,2),abs(Med1(i,3)-Med2(l,3))/2];
        else
          if (Med1(i,2)-Med2(l,2)) > (Med2(l+1,2)-Med1(i,2))
            M(k,:) = [Med1(i,2),abs(Med1(i,3)-Med2(l+1,3))/2];
            endif
        endif
      k=k+1;
      endif
    endfor
  endfor
endfunction