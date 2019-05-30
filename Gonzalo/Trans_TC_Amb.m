function TTC=Trans_TC_Amb(Med_TC_TR,Tipo_TC,No_TermoRes) %Esta funcion recibe la medicion de la termocupla y la
    if strcmpi(Tipo_TC,'k') == 1                         %termo-resistencia y la devuelve ya transformada
        load('19-05-02\TCK.mat');                        %a temperatura para ambas mediciones
        Termo_Cupla=[TClK(:,1),TClK(:,2)/1000];                                %Ademas, recibe tambien el tipo de termocupla y la termoresistencia utilizadas
    end
    if No_TermoRes == 2 % Esta es la transformación correespondiente a la termoresistencia TR2 segun la ultima calibración
        f=@(x) (-99.95346*0.0039183615+((99.95346*0.0039183615)^2-4*(-5.6337919e-7)*99.95346*(99.95346-x))^(1/2))/(2*99.95346*(-5.6337919e-7));
    end
    Lt=length(Med_TC_TR(:,1));
    i=1;
    j=1;
    while i<=Lt
        if Med_TC_TR(i,4)<Termo_Cupla(j,2) && Med_TC_TR(i,4)<Termo_Cupla(j+1,2)
            j=j-1;
        else
            if Med_TC_TR(i,4)>=Termo_Cupla(j+1,2)
                j=j+1;
            else
                Tiempo_Med = (Med_TC_TR(i,1)-12)*3600+Med_TC_TR(i,2)*60+Med_TC_TR(i,1);
                Delta_Temp_Amb = Termo_Cupla(j,1)+(Med_TC_TR(i,4)-Termo_Cupla(j,2))*(Termo_Cupla(j+1,1)-Termo_Cupla(j,1))/(Termo_Cupla(j+1,2)-Termo_Cupla(j,2));
                Temp_Amb = f(Med_TC_TR(i,5));
                TTC(i,:)=[Tiempo_Med,Delta_Temp_Amb,Temp_Amb];
                i=i+1;
            end
        end
    end
end