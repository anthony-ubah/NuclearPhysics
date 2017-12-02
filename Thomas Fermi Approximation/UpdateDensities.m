% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Density Update Function

function [densities,fsum,mu_p,mu_n] = UpdateDensities(shared_data,fields, sources, densities, mu_p, mu_n)
    [densities,mu_p] = UpdateProtonDensity(mu_p,densities,shared_data,fields);
    [densities,f_p] = CombineOldAndNew(densities,shared_data,1);
    [densities,mu_n] = UpdateNeutronDensity(mu_n,densities,shared_data,fields);
    [densities,f_n] = CombineOldAndNew(densities,shared_data,0);
    fsum = (f_p+f_n)/2;
end