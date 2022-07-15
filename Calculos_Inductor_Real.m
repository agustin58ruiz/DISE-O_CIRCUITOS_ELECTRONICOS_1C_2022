%% Dise�o de circuitos - 1er cuatrimestre 2022 - TP Integrador
%   Program for helping in inductor desing
%   Author: Agustin Ruiz

%% Main 
clear all; close all; clc;

% Variables: Set 
AreaCore =1.14 ; % En cm2
AreaWindow = 1.085; % In cm2
MeanLengthTurn = 6.28; % in cm
Resistivity = 1.724e-6;% Copper resistivity [ohm x cm]
Bsat = 300e-3; % Saturation Magnetic Flux Density in Tesla
alpha = 1; % alpha = Bmax / Bsat 
Bmax = alpha * Bsat;
Imax = 1.6; % Max current in ampere
L = 65.3e-6; % Inductance in henry
Ku = 0.4; % Utilization factor
CopperResistance = 0.05; %Resistance of copper in ohm



[Lg,n,Aw] = main(Resistivity, Imax, L, CopperResistance,...
    Ku, Bmax,...
    AreaCore, AreaWindow, MeanLengthTurn);
fprintf("%s: %f\n","Core Gap Length in cm", Lg*100)
fprintf("%s: %f\n","Number of turns", n)
fprintf("%s: %f\n","Area wire in cm^2", Aw)

%%
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

function [Lg,n,Aw]= main(rho, Imax, L, R, Ku, Bmax, Ac, Wa, MLT)
% Inputs: 
%   rho   : resistivity of wire in ohm*cm
%   Imax  : max current through the inductor in ampere
%   L     : inductance in henry
%   R     : resistance of the wire in ohm
%   Ku    : fill factor of the wire (0, 1)
%   Bmax  : Max magnetic flux density in tesla
%   Ac    : Area core in cm^2
%   Wa    : Windows Area in cm^2
%   MLT   : Mean Length Turn in cm
% Outputs:
%   Lg    : gap length in m
%   n     : turns
%   Aw    : Area Wire in cm^2
    Kg_min = computeKg(rho, L, Imax, Bmax, R, Ku);
    Kg = Ac.*Ac.*Wa./MLT;
    if Kg < Kg_min
      exception = MException("AcctError:NoClient",...
          "main:Core doesn't comply specifications. Try increasing Kg=Ac^2*Wa/MLT") ;
      throw(exception);
    end
    Lg = computeLengthGap(L, Imax, Bmax, Ac);
    n = computeNumberTurns(L, Imax, Bmax, Ac);
    Aw = computeWireArea(Ku, Wa, n);
end

