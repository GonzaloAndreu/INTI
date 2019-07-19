%pkg load data-smoothing

%STCK=regdatasmooth(TempMed_TCK_Termistor(200:3000,1),TempMed_TCK_Termistor(200:3000,2),"d",4,"stdev",0.001);

d=2
STCK1=mSmooth(TempMed_TCK_Termistor(200:3000,2),5,d);
STCK2=mSmooth(TempMed_TCK_Termistor(200:3000,2),8,d);
STCK3=mSmooth(TempMed_TCK_Termistor(200:3000,2),11,d);
STCK4=mSmooth(TempMed_TCK_Termistor(200:3000,2),14,d);
STCK5=mSmooth(TempMed_TCK_Termistor(200:3000,2),17,d);
STCK6=mSmooth(TempMed_TCK_Termistor(200:3000,2),20,d);
STCK7=mSmooth(TempMed_TCK_Termistor(200:3000,2),23,d);
STCK8=mSmooth(TempMed_TCK_Termistor(200:3000,2),26,d);

sum(STCK1(:,2))
sum(STCK2(:,2))
sum(STCK3(:,2))
sum(STCK4(:,2))
sum(STCK5(:,2))
sum(STCK6(:,2))
sum(STCK7(:,2))
sum(STCK8(:,2))
hold
plot(STCK1(:,1))
plot(STCK2(:,1))%,"r")
plot(STCK3(:,1))%,"g")
plot(STCK4(:,1))%,"k")
plot(STCK5(:,1))%,"m")
plot(STCK6(:,1))%,"c")
plot(STCK7(:,1))%,"w")
plot(STCK8(:,1))%,"b")

legend('STCK1','STCK2','STCK3','STCK4','STCK5','STCK6','STCK7','STCK8')

plot(TempMed_TCK_Termistor(200:3000,2))%r")



%%
n=200
d=2
STCK_t=mSmooth(TempMed_TCK_Termistor(200:3000,2)-TempMed_TCK_Termistor(200,2),n,d);
STermi_t=mSmooth(TempMed_TCK_Termistor(200:3000,3)-TempMed_TCK_Termistor(200,3),n,d);
STCK=[TempMed_TCK_Termistor(200:3000,1),STCK_t(:,1)];
STermi=[TempMed_TCK_Termistor(200:3000,1),STermi_t(:,1)];
dSTCK=dT2(STCK);
dSTermi=dT2(STermi);
hold

plot(STCK(:,2),dSTCK(:,2))
plot(STermi(:,2),dSTermi(:,2))
legend('Termocupla','Termistor')

