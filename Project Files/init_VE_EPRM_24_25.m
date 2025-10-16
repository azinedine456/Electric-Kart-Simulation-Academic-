% ----------------------------------------------------------------
%
%		Programme Matlab : init_VE_EPRM_24_25.m
%       
%		Initialisation (Matlab)
%		d'un
%       Kart
%       Electrique à
%       Machine à
%       Courant
%       Continu à
%       Aimants
%       Permanents
%
% ----------------------------------------------------------------
%		Crée par C.Mayet                         : 23 Octobre 2018
%		Dernière modification par A. Desreveaux       : 01 Avril 2025
% ----------------------------------------------------------------
%       FIP EPRM I2 (2023-2024)
%       Conservatoire National des Arts et Métiers (CNAM) (France)
% ----------------------------------------------------------------

    clc; clear

% *************************************************************** %
%                          Cycle de vitesse                       %
% *************************************************************** %
    
    % Cycle de vitesse normalisé ECE
    load cycle_ECE;

% *************************************************************** %
%                      Batteries Plomb (BAT)                      %
%                    (OPTIMA@ YellowTop R 3,7)                    %
% *************************************************************** %
Voc=2;
cel_serie=6;
mod_serie=4;
Rcell=0.53*10^-3;
% Rbat= Rcell*cel_serie*mod_serie;
vbat = Voc*cel_serie*mod_serie;


% *****************************************************************
%                        Convertisseur (EP)                       %
%          (SEVCON Millipak 4Q 24V - 48V 300A standard)           %
% *****************************************************************
nconv = 0.96;

% *****************************************************************
%                  MCC à Aimants Permanents (MCC)                 %
%                       ME0909 (Brush-Type)                       %
% *****************************************************************
Rmcc = 0.032; %Resistance de l'armature + balais
fdec =16000;
In = 100; %Courant nominal de la MCC
Deltai = 0.1*In; % Ondulation de courant max
Lmcc = vbat/(2*fdec*Deltai) ; % Inductance rajoutée pour limiter les ondulations
ke = 0.107; %Constante de vitesse 
ki = ke; %Constante de couple


% *****************************************************************
%                   Transmission Mécanique (TRA)                  %
%         (Lock Steel Pulley 30mm wide 22-8M-30-F TL 1008)        %
% (Driven toothed aluminum wheel 75 teeth HTD-8M for 30 mm shaft) %
%                   (DURO Rear Tire 11 x 7.10-5)                  %
% *****************************************************************
kred = 75/22; % Rapport de reduction de la transmission 
r = (279.4*10^-3)/2; % Rayon de roue
n = 0.92; % Rendement de la transmission
% *****************************************************************
%                        Chassis du VE (CHA)
% *****************************************************************
Mv = 295; % Masse vehicule + chauffeur


% *****************************************************************
%                   Environement mécanique (ENV)
% *****************************************************************
f = 0.02; % Coefficient de resistance au roulement
g = 9.81; % Acceleration de la pesanteur 
cx = 0.2; % Aerodynamisme standard
rho = 1.223; % Masse volumique de l'air
S = 0.95; % Section transversale du kart.
angle = 10*(pi/180) ; % Angle de la pente
% Vv = 14; % 14 m/s
Vv=10/3.6; %10 km/h

% *****************************************************************
%                           Control (CRT)
% *****************************************************************
%Regulateur P mécanique
t5m=0.1;
taum=t5m/3;
Kpm=Mv/taum;



%Regulateur PI electrique
taue= Lmcc/Rmcc;
gaine=1/Rmcc;
t5e = 0.01; %0.01 s

tftbe=t5e/3;

Kpe= taue/(gaine*tftbe);
Kie=Kpe/taue;




% *****************************************************************
% 				   Display of initialization end 
% *****************************************************************

disp(' ');
disp('****** Initialisation VE_EPRM_24_25 ******');
disp('******            terminée          ******');
disp(' ');