function TT=TU_Temp(Med_Temp,Tipo_Sensor)
%Los inputs de esta funcion son:
%       Med_Temp:   La matriz de datos de temperatura mas tiempos de medicion
%                   para cada 1 (los tiempos de medicion deben ser todos los mismos 
%                   y puestos en la primer columna)
%
%       Tipo_Sensor:Vector que especifique el tipo de sensor utilizado, por
%                   ejemplo, para una termocupla tipo K se debe poner el
%                   imput 'k', para una termorecistencia, el numero de
%                   termoresistencia. Ponga '0' para ignorar alguna oclumna
%                   particular
%Es necesario que los datos de temperatura esten en un formato de columnas
%de la siguiente manera [hora,minuto,segundos,Medicion de Temperatura (1:n)]
%En caso de no estar agregado el caso es necesario agregarlo con un nuevo
%if que responda la caso correspondiente
    if Med_Temp(1,1)<12
        a=0;
    else
        a=12;
    end
    TT=(Med_Temp(:,1)-a)*3600+Med_Temp(:,2)*60+Med_Temp(:,3);
    Lt=length(Med_Temp(:,1));
    for h=1:length(Tipo_Sensor)
        if Tipo_Sensor(h) == 'k'
            load('19-05-02\TCK.mat');                        
            Termo_Cupla=[TClK(:,1),TClK(:,2)/1000];          
            i=1;
            j=1;
            while i<=Lt
                if Med_Temp(i,h+3)<Termo_Cupla(j,2) && Med_Temp(i,h+3)<Termo_Cupla(h+1,2)
                    j=j-1;
                else
                    if Med_Temp(i,h+3)>=Termo_Cupla(j+1,2)
                        j=j+1;
                    else
                        Delta_Temp_Amb = Termo_Cupla(j,1)+(Med_Temp(i,h+3)-Termo_Cupla(j,2))*(Termo_Cupla(j+1,1)-Termo_Cupla(j,1))/(Termo_Cupla(j+1,2)-Termo_Cupla(j,2));
                        TTh(i)=[Delta_Temp_Amb];
                        i=i+1;
                    end
                end
            end
        TT=[TT,TTh'];
        end
        if Tipo_Sensor(h) == 2 % Última calibración de la termoresistencia TR2
            f=@(x) (-99.95346*0.0039183615+((99.95346*0.0039183615)^2-4*(-5.6337919e-7)*99.95346*(99.95346-x)).^(1/2))/(2*99.95346*(-5.6337919e-7));
            TTh=f(Med_Temp(:,h+3));
            TT=[TT,TTh];
        end
        if Tipo_Sensor(h) == 'T' % "Calibracion" Termistor usado
            load('Termistor.mat')
            TTh=g(Param,Med_Temp(:,h+3));
            TT=[TT,TTh];
        end
        if Tipo_Sensor(h) == 'D' % Datos tirados directamente por el Sensor Dallas
            TTh=Med_Temp(:,h+3);
            TT=[TT,TTh];
        end
    end
end