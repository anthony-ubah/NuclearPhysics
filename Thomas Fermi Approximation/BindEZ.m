% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Binding Energy With Z Dependence Before av

function [BEZ, aA] = BindEZ(Z,A)
    av = 4.9;
    as = 0.062;
    ac = -0.00084;
    BEZ = av - as*A.^(-1/3)-ac.*Z.^2.*A.^(-4/3);
    aA = -BEZ*A^2/(Z-A/2)^2;
end