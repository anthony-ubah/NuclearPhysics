% Name: Anthony Ubah
% ID: 260561718
% Course: PHYS 557 - Nuclear Physics
% Computing Assignment 7
% Calculate Proton Number

function [pnum,densities] = CalcProtonNumber(shared_data,fields,densities,mu_p)
    dr = shared_data.rmax/shared_data.nmax;
    r = 0:dr:shared_data.rmax;
    densities.rho_p = GetRho(mu_p, fields.sigma, fields.rho0, fields.omega, fields.A0, shared_data.nmax, shared_data.rmax, shared_data, 1);
    f = pnumIntegral(r,densities.rho_p);
    pnum = 4*pi*NumIntegrateVec(f,dr,1,shared_data.nmax+1,shared_data.nmax);
end