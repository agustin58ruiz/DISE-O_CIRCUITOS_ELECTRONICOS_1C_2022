clear all;
close all;
% opts = detectImportOptions('buck_driver_AC.txt');
% AC_datos   = readtable('buck_driver_AC.txt',opts);
% 
% frecuencia = table2array(AC_datos(:,1));
% ganancia = zeros((length(frecuencia)-1)/2,2);
% fase = zeros((length(frecuencia)-1)/2,2);
% i2 = 1;
% largo = (length(frecuencia)-1)/2;
% for i=1:length(frecuencia)
%     if(~isnan(AC_datos{i,1}))
%         a = sscanf(string(AC_datos{i,2}), strcat("%f","dB,","%f",char(176),")"));
% 
%         ganancia(i - (largo+1)*(i2-1),i2) = a(1);
%         fase(i - (largo+1)*(i2-1),i2) = a(2) ;
%     else
%         frecuencia = [frecuencia(1:i-1,1),frecuencia(i+1:end,1)];
%         i2 = 2;
%     end
%     
% end
% 
% figure
% yyaxis left
% semilogx(frecuencia(:,1),ganancia(:,1))
% ylabel("Ganancia [dB]")
% yyaxis right
% semilogx(frecuencia(:,1),fase(:,1))
% ylabel("Fase [°]")
% grid on
% xlabel("Frecuencia [Hz]")
% 
% figure
% yyaxis left
% semilogx(frecuencia(:,2),ganancia(:,2))
% ylabel("Ganancia [dB]")
% yyaxis right
% semilogx(frecuencia(:,2),fase(:,2))
% ylabel("Fase [°]")
% grid on
% xlabel("Frecuencia [Hz]")

opts = detectImportOptions('buck_driver.txt');
datos   = readtable('buck_driver.txt',opts);

figure
plot(datos{:,1},datos{:,2},datos{:,1},datos{:,3})
ylabel("[V]")
grid on
xlabel("Tiempo [s]")
legend("HS","LS")

figure
plot(datos{:,1},datos{:,4})
ylabel("[V]")
grid on
xlabel("Tiempo [s]")
legend("Vo")

figure
plot(datos{:,1},datos{:,5},datos{:,1},datos{:,6})
ylabel("[A]")
grid on
xlabel("Tiempo [s]")
legend("I_L", "I_R")