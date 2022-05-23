clear all;
close all;
fsw = 200e3 % Hz
Id = 10e-3:1e-3:1.6; % A
Vds = 36 % V
Vdrv = Vds % V
Vo = 6.35
D = Vo/Vds

% % IRF9520
% Rdson = 0.6 % Ohm
% Qgate = 6.89855e-008 % C
% Vth = 4
% tsw = 24e-9 % s
% 
% 
% 
% 
% Pgate = 2 * fsw * Qgate * Vdrv;
% Pcond = Id.^2 * Rdson * D + Id.^2 * Rdson * 1-D;
% Psw = 2 * 0.5 * Vds * Id * fsw * tsw;
% 
% %Ploss = Pcond + Psw .+ Pgate % Octave
% Ploss = Pcond + Psw + Pgate; % Matlab
% figure()
% plot(Id, Ploss)
% 
% eff = (Vds*Id)./(Ploss+(Vds*Id));
% 
% figure()
% plot(Id, eff)
Vdrv = 10
% IRF520
Rdson = 0.23 % Ohm
Qgate = 7.44063e-009 % C
Vth = 2.9
tsw = 16.5e-9 % s




Pgate = 2 * fsw * Qgate * Vdrv;
Pcond = Id.^2 * Rdson
Psw = 2 * 0.5 * Vds * Id * fsw * tsw;

%Ploss = Pcond + Psw .+ Pgate % Octave
Ploss = Pcond + Psw + Pgate; % Matlab
figure()
plot(Id, Ploss)

eff = (Vds*Id)./(Ploss+(Vds*Id));

figure()
plot(Id, eff)