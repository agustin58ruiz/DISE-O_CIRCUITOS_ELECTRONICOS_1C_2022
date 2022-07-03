clear all; close all; clc;

AreaCore =15 ; % En mm2
AreaWindow = 15; % In mm2
MeanLengthTurn = 50;
Resistivity = 1.72e-8;% Ohm x meter
N = 15; % Wire turns
Bmax = 15; %Magnetic Flux Density in Tesla
Mu_0 = 4*pi*e-7; % Magnetic Permeability of free space
R_gap = 456; % Gap reluctance


function Kg = computeKg(rho, L, Imax, Bmax, R, Ku)
% computeKg computes the core geometric constant Kg =
% (1e8*rho*L^2*Imax^2)/(Bmax^2*R*Ku)
% Inputs:
%   rho  : resistivity of wire in ohm*cm
%   L    : inductance in henry
%   Imax : max current through the inductor in ampere
%   Bmax : max flux density of the core in tesla
%   R    : resistance of the wire in ohm
%   Ku   : fill factor of the wire (0, 1)
% Outputs:
%   Kg   : core geometric constant in cm^5
    aux = rho.*L.*L.*Imax.*Imax;
    Kg= 1e8*aux./(Bmax.*Bmax.*R.*R.*Ku);
end 