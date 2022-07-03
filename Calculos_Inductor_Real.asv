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

function lengthGap = computeLengthGap(L, Imax, Bmax, Ac)
% computeLengthGap compute the length of the gap in m
% it optionally give us the inductunce per 1000 turn A_L in mH/1000 turns 
% Inputs:
%   L    : inductance in henry
%   Imax : max current through the inductor in ampere
%   Bmax : max flux density of the core in tesla
%   Ac   : core area in cm^2
% Outputs:
%   lengthGap : length of the gap in m
    permeability = 1.2566e-06; % Permeability of free space
    lengthGap = permeability*L.*Imax*Imax*1e4;
    lengthGap = lengthGap ./ (Bmax.*Bmax*Ac) ;
end

function n = computeNumberTurns(L, Imax, Bmax, Ac)
% computeNumberTurns it compute the number of turns 
% Inputs:
%   L    : inductance in henry
%   Imax : max current through the inductor in ampere
%   Bmax : max flux density of the core in tesla
%   Ac   : core area in cm^2
% Outputs:
%   n    : number of turns

    n = L.*Imax.*1e4;
    n = n ./ (Bmax.* Ac);
end 

function wireArea = computeWireArea(Ku, Wa, n)
% This function compute the wireArea, this is a maximun value
% Inputs:
%   Ku   : fill factor of the wire (0, 1)
%   Wa   : windows area in cm^2
%   n    : number of turns
% Outputs:
%   wireArea : the max wire area in cm^2
    wireArea = Ku.*Wa./n;
end

function main(rho, Imax, L, R, Ku, Bmax, Ac, Wa, MLT)
% Inputs: 
%   rho   :
%   Imax  :
%   L     :
%   R     :
%   Ku    :
%   Bsat  :
%   Ac    :
%   Wa    :
%   MLT   :
end