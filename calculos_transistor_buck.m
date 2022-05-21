clear all;
close all;
fsw = 200e3 % Hz
Id = 10e-3:1e-3:1.6; % A
Vds = 36 % V
D = .5

% IRF9520

Rdson = 0.6 % Ohm
Vdrv = 6.3 % V
Qgate = 6.89855e-008 % C
Vth = 4
tsw = 24e-9 % s




Pgate = fsw * Qgate * Vdrv;
Pcond = Id.^2 * Rdson * D;
Psw = 0.5 * Vds * Id * fsw * tsw;

%Ploss = Pcond + Psw .+ Pgate % Octave
Ploss = Pcond + Psw + Pgate; % Matlab
figure()
plot(Id, Ploss)

eff = 1- Ploss./(Vds*Id);

figure()
plot(Id, eff)
