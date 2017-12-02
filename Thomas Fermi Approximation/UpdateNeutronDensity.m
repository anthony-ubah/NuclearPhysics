% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Update Neutron Density

function [densities,mu_now] = UpdateNeutronDensity(mu_n,densities,shared_data,fields)
    [mu_now,densities] = newton_method(@CalcNeutronNumber,shared_data.N,mu_n,shared_data,fields,densities);
end