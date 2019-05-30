function TC=Conversor(A) % esto toma la tabla de una termocupla y la convierte en una lista de tuplas 
l=length(A(:,1));       % comparando temperatura con voltaje esperado
h=1;
for i = 1:l
    if A(i,2)<A(i,3)
            a=1;
        else
            a=-1;
        end
    for j= 2:11
        if isnan(A(i,1)) || isnan(A(i,j)) %esto eleminina los huecios vacios o los caracteres que no sean numeros
        else
            Intermediario(h,:)=[A(i,1)+a*(j-2),A(i,j)];
            h=h+1;
        end
    end
end
TC=sortrows(Intermediario,1);
end