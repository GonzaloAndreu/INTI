pkg load data-smoothing

STCK=regdatasmooth(TempMed_TCK_Termistor(200:3000,1),TempMed_TCK_Termistor(200:3000,2),"d",4,"stdev",0.001);

d=2
STCK1=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),5,d);
STCK2=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),8,d);
STCK3=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),11,d);
STCK4=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),14,d);
STCK5=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),17,d);
STCK6=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),20,d);
STCK7=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),23,d);
STCK8=mSmooth(TempMed_TCK_Termistor(200:3000,2),TempMed_TCK_Termistor(200:3000,1),26,d);
hold
sum(STCK1(:,3))
sum(STCK2(:,3))
sum(STCK3(:,3))
sum(STCK4(:,3))
sum(STCK5(:,3))
sum(STCK6(:,3))
sum(STCK7(:,3))
sum(STCK8(:,3))

plot(STCK1(:,1))
plot(STCK2(:,1),"r")
plot(STCK3(:,1),"g")
plot(STCK4(:,1),"k")
plot(STCK5(:,1),"m")
plot(STCK6(:,1),"c")
plot(STCK7(:,1),"w")
plot(STCK8(:,1),"b")

figure 2
plot(STCK1(:,3))

plot(TempMed_TCK_Termistor(200:3000,2),"-*r")

dSTCK3=dT2(STCK3)