% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Update Proton Density

function [densities,mu_now] = UpdateProtonDensity(mu_p,densities,shared_data,fields)
    [mu_now,densities] = newton_method(@CalcProtonNumber,shared_data.Z,mu_p,shared_data,fields,densities);
end