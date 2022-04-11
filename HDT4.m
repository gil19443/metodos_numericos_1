%% Durbin Watson test
%load('HDT4.mat');
x = [year, TasasDeIntersDeHipotecasYPreciosDeApartamentos];
x1 = [year, hipoteca];
md2 = fitlm(x1, TasasDeIntersDeHipotecasYPreciosDeApartamentos);
md1 = fitlm(x, hipoteca);
[p, DW] = dwtest(md1,'exact','both')
[p2, DW2] = dwtest(md2,'exact','both')
save('HDT4.mat');