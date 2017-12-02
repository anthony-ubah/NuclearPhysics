% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 5
% Fermi Momentum Function

function P_Fermi = GetPFermi(Efermi, mass)
    vector = Efermi.^2 - mass.^2;
    vector(vector < 0) = 0;
    P_Fermi = sqrt(vector);
end