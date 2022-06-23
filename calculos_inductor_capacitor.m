clear all; close all;
Vs = 6.35 % V
Ve = 36 % V
D = Vs / Ve
f = 200e3 % Hz
Is = 1% A
ripple_max_I = 40/100 % 40%
ILmax = Is * (1 + ripple_max_I/2) % A
L = 1/2/f * (1-D) * Vs / (ILmax - Is) % H


Is = 1.6 % A
ripple_max_V = 5/100 %
ILmax = Is + 1/2/f * (1-D) * Vs / L % H
ILmin = ILmax - Vs* (1-D) /f / L
C = (ILmax - ILmin)/(16 * ripple_max_V * Vs * f)

% Boost

Vs=18
Ve=12*1.1
Vsat=0.5
Vd=0.4
f=50e3
Ilmax=1.66
A=(Vs+Vd)/(Ve-Vsat)-1
D=A/(1+A)


Lc=Ve*D/f/Ilmax